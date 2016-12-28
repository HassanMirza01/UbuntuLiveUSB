# run inside chroot
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devpts none /dev/pts

export HOME=/root
export LC_ALL=C
dbus-uuidgen > /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

# apt-get update && apt-get -y upgrade

# # useful tools
# sudo apt-get -y install emacs audacity
# sudo apt-get -y install acpica-tools uuid-dev uuid-dev nasm
# sudo apt-get -y install git git-email gitk sshpass openssh-server

# # UCM files (FIXME: this needs to move to packages)
# cd
# wget https://github.com/plbossart/UCM/archive/master.zip
# unzip master.zip
# cd UCM-master
# cp -r *  /usr/share/alsa/ucm
# cd ../
# rm -rf UCM-master master.zip

# # get all dependencies
# apt-get build-dep -y linux-image-4.8.0-22-generic
# apt-get -y install git build-essential fakeroot libncurses5-dev libssl-dev ccache

# # recompile kernel
# cd
# wget https://github.com/plbossart/sound/archive/experimental/codecs.zip
# unzip codecs.zip
# cd sound-experimental-codecs
# cp /boot/config-4.8.0-22-generic .config
# scripts/kconfig/merge_config.sh .config /defconfig
# make olddefconfig

# make -j `getconf _NPROCESSORS_ONLN` deb-pkg LOCALVERSION=-custom

# cd ..
# sudo dpkg -i linux-image-4.9.0-custom_4.9.0-custom-1_amd64.deb
# sudo dpkg -i linux-headers-4.9.0-custom_4.9.0-custom-1_amd64.deb

# # remove compiled sources and binaries
# sudo rm -rf sound-experimental-codecs codecs.zip UCM linux*

echo "do additional manual configs and source step3.sh when finished"









































