# UbuntuLiveUSB

Scripts to create custom Ubuntu Live USB with latest audio fixes for
Intel platforms. Users will be able to test if their audio subsystem
is supported in the latest Linux kernels (patches already queued for
upstream integration and experimental ones) and report issues.

The scripts are shamelessly borrowed from the following sites:

1. https://nathanpfry.com/how-to-customize-an-ubuntu-installation-disc/
(apparently no longer available)

2. https://wiki.ubuntu.com/KernelTeam/GitKernelBuild (shared under a
Creative Commons Attribution-ShareAlike 3.0 License available at
https://help.ubuntu.com/community/License)

step1.sh pulls all the required files and creates the chroot environment

step2.sh is run in the chroot. It configures all packages, recompiles
the latest experimental kernel with fixes for Intel audio platforms
and adds UCM files

step3.sh cleans up the chroot and exits

step4.sh creates the ubuntu-custom.iso image

step5.sh cleans up all the setup and build artefacts.

Pre-built images will be provided as releases.

The scripts are provided as is in the hope that they are useful using
the same Creative Commons license as the original Ubuntu wiki. The
user is alerted to the fact that using experimental audio drivers and
firmware may result in hardware damage for which there is no warranty
or liability.

