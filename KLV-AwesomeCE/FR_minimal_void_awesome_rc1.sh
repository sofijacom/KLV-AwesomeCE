#!/bin/bash
# wiak Created: 15Aug2023 Revised: 15Aug2023 Licence: MIT
# sofiya Created: 24Aug2023 Revised: 31Aug2023 Licence: MIT
# version 2.00 -rc1 Sofiy 09.25.2023

# General Build Instructions:
# Create an empty directory at root of partition you want to bootfrom
# For example: /KLV_minimal_Awesome
# In a terminal opened at that bootfrom directory simply run this single script!!! ;-)

# Fetch the build_firstrib_rootfs build parts:
wget -c https://gitlab.com/firstrib/firstrib/-/raw/master/latest/build_system/build_firstrib_rootfs.sh && chmod +x build_firstrib_rootfs.sh

# rockedge minimal Void Linux build plugin used during the build (you can add to this plugin for whatever extras you want in your build)
wget -c https://gitlab.com/sofija.p2018/kla-ot2/-/raw/main/KLV-Awesome-CE/awesome_plug/f_00_Void_KLV_no-kernel_awesome.plug

# Download the boot components:
wget -c https://gitlab.com/sofija.p2018/kla-ot2/-/raw/main/KLV-Bspwm/Kernel-6-1-38-rock-rt13c/initrd.gz -O initrd.gz  # FR skeleton initrd
wget -c https://gitlab.com/sofija.p2018/kla-ot2/-/raw/main/KLV-Bspwm/Kernel-6-1-38-rock-rt13c/vmlinuz
wget -c https://gitlab.com/sofija.p2018/kla-ot2/-/raw/main/KLV-Bspwm/Kernel-6-1-38-rock-rt13c/00modules-6.1.38-rock-rt13c.sfs  # modules
wget -c https://gitlab.com/sofija.p2018/kla-ot2/-/raw/main/KLV-Bspwm/Kernel-6-1-38-rock-rt13c/01firmware-6.1.38.sfs  # firmware

# Some useful FirstRib utilities in case you want to modify the initrd or the 07firstrib_rootfs
# All these utilities have a --help option
wget -c https://gitlab.com/firstrib/firstrib/-/raw/master/latest/build_system/wd_grubconfig && chmod +x wd_grubconfig  # When run finds correct grub menu stanza for your system
wget -c https://gitlab.com/firstrib/firstrib/-/raw/master/latest/build_system/modify_initrd_gz.sh && chmod +x modify_initrd_gz.sh  # For 'experts' to modify initrd.gz
wget -c https://gitlab.com/firstrib/firstrib/-/raw/master/latest/build_system/mount_chroot.sh && chmod +x mount_chroot.sh  # To enter rootfs in a chroot
wget -c https://gitlab.com/firstrib/firstrib/-/raw/master/latest/build_system/umount_chroot.sh && chmod +x umount_chroot.sh  # to 'clean up mounts used by above mount_chroot.sh'

# Optional addon layers

# Main KL addon containing the likes of gtkdialog, filemnt, UExtract, gxmessage, save2flash and more
# save2flash works with command-line-only distros too
wget -c https://gitlab.com/sofija.p2018/kla-ot2/-/raw/main/KLV-Awesome-CE/15gtkdialogGTK3_filemnt64/15gtkdialogGTK3_filemnt64.sfs

# Build the Void Linux root filesystem to firstrib_rootfs directory
# NOTE WELL: If you have an alternative f_plugin in your bootfrom directory (name must start with f_),
# simply alter below command to use it
./build_firstrib_rootfs.sh void default amd64 f_00_Void_KLV_no-kernel_awesome.plug

# Number the layer ready for booting
mv firstrib_rootfs 07firstrib_rootfs

# The only thing now to do is find correct grub stanza for your system
printf "\nPress any key to run utility wd_grubconfig
which will output suitable exact grub stanzas
Use one of these with your pre-installed grub
Press enter to finish\n"
read choice
./wd_grubconfig
exit 0


