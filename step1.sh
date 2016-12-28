#https://nathanpfry.com/how-to-customize-an-ubuntu-installation-disc/
#https://zyisrad.com/linux-livecd-customization

sudo dnf -y install squashfs-tools genisoimage

#update this line as needed to point to initial image
cp ~/Downloads/ubuntu-16.10-desktop-amd64.iso ubuntu.iso

mkdir mnt
mkdir extract
sudo mount -o loop ubuntu.iso mnt/

sudo rsync --exclude=/casper/filesystem.squashfs -a mnt/ extract
sudo unsquashfs mnt/casper/filesystem.squashfs
sudo mv squashfs-root edit
# we are done with the ISO. Unmount it
sudo umount mnt

sudo cp /etc/resolv.conf edit/etc/
sudo mount --bind /dev/ edit/dev

#configure sources and kernel config inside chroot
#sudo cp sources.list edit/etc/apt
#sudo cp defconfig edit/
sudo cp step2.sh edit/
sudo cp step3.sh edit/

#enter chroot
echo "next step: source step2.sh"
sudo chroot edit
