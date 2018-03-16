![antergos-rescue](http://antergos.kamprad.net/antergos-rescue/images/rescue-desktop.png)
# a swiss-knife USB-Live-ISO for Antergos
!!!!!!! ISO IS NOT JET READY IT IS UNDER HEAVY DEVELOPMENT: DO NOT USE FOR RESCUE ON IMPORTANT DATA !!!!!!! 

Latest builds are aviable over my webside: http://antergos.kamprad.net/antergos-rescue/release/

Discussion on the ISO will happen here: https://forum.antergos.com/topic/8937/antergos-rescue-the-antergos-swiss-knive-live-iso

ISO is now a fork from original archiso https://git.archlinux.org/archiso.git/ 

* Includes XFCE4 LiveEnvironment with all the systemtools needed for rescue.
* Bootoptions to boot with properitary nvidia drivers is included.

# build the iso on your own:

Install: 
`sudo pacman -S git arch-install-scripts dosfstools libisoburn mkinitcpio-nfs-utils make patch squashfs-tools wget cpio gfxboot lynx btrfs-progs`

# cloning

Cloning this repository like this: `git clone https://github.com/killajoe/antergos-rescue.git --recursive`

Enter into antergos-rescue folder and install our modified mkarchiso by running: `cd antergos-rescue` and then `sudo make install`

following commands needs to be done all as root (su to get so) then copy the installed files from installdir to your builddir: `cp -R /usr/share/archiso/configs/releng  //builddir`

# Build the ISO

Now you are ready to turn your files into the .iso which you can then burn to CD or USB:

First create the out/ directory:

`mkdir //builddir/out/` then inside //builddir, execute:

`./build.sh -v`

The script will now download and install the packages you specified to work/*/airootfs, create the kernel and init images, apply your customizations and finally build the iso into out/.

# Rebuild the ISO

You have to remove work directory:

`rm -R work`
