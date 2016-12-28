#create image

sudo umount edit/dev || sudo umount -lf edit/dev

# make the manifest writable
sudo chmod +w extract/casper/filesystem.manifest

# write the manifest
sudo chroot edit dpkg-query -W --showformat='${Package} ${Version}n' | sudo tee extract/casper/filesystem.manifest

sudo cp extract/casper/filesystem.manifest extract/casper/filesystem.manifest-desktop

sudo sed -i '/ubiquity/d' extract/casper/filesystem.manifest-desktop

sudo sed -i '/casper/d' extract/casper/filesystem.manifest-desktop

# remove the old filesystem
sudo rm extract/casper/filesystem.squashfs

# Compress the filesystem

sudo mksquashfs edit extract/casper/filesystem.squashfs

printf $(sudo du -sx --block-size=1 edit | cut -f1) | sudo tee extract/casper/filesystem.size

cd extract
sudo rm md5sum.txt

find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee md5sum.txt

# Make the ISO!
sudo mkisofs -D -r -V "$IMAGE_NAME" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../ubuntu-custom.iso .

sync
cd ..

# burn to disk 
echo "burn to disk"
echo "example: dd if=ubuntu-custom.iso of=/dev/sdb oflag=direct bs=1048576"
