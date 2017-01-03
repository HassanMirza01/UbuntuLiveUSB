cp ~/Downloads/ubuntu-16.10-desktop-amd64.iso /tmp

./1-create-development-chroot.sh
./2-enter-development-chroot-build.sh
./5-exit-development-chroot.sh
./6-create-iso-chroot.sh
./7-install-kernel.sh
./8-update-initrd.sh
./9-make-iso.sh

rm /tmp/defconfig
rm /tmp/efi_boot_bootia32.efi
rm /tmp/efi_img_bootia32.efi
rm /tmp/sources.list
rm /tmp/ubuntu-16.10-desktop-amd64.iso
rm -rf /tmp/UCM-master
rm /tmp/ubuntu-16.10-desktop-amd64.iso

sudo rm -rf development-chroot/
sudo rm -rf iso-chroot/
sudo rm -rf iso-directory-structure/
rm master.zip
