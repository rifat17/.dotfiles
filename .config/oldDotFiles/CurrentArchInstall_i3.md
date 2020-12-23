# Current ArchLinux Installation

- Download the ISO from [archlinux official site](https://www.archlinux.org/download/)

- Prepare an installation medium


		$ lsblk

		sudo dd bs=4M if=archlinux/iso/path of=/dev/sdX status=progress && sync

- Boot the live environment

- Set the keyboard layout

		# ls /usr/share/kbd/keymaps/**/*.map.gz
		# loadkeys us

- Verify the boot mode

		# ls /sys/firmware/efi/efivars

- Connect to the internet\[WIFI]

		# iwctl
		# station wlan0 connect "Danger Zone"

*wlan0* my wifi card,
*Danger Zone* My Wifi connection.

type **help** and follow to get wifi card name and connection name.

		# exit
		# ping -c3 google.com


- - -

> i use archfi script for automate my installation

# [archfi](https://github.com/MatMoul/archfi)
- - -
Just a simple bash script wizard to install Arch Linux after you have booted on the official Arch Linux install media.

With this script, you can install Arch Linux with two simple terminal commands.

This wizard is made to install minimum packages (Base, bootloader and optionally archdi).

At the end of this wizard, you can install or launch [archdi](https://github.com/MatMoul/archdi) (Arch Linux Desktop Install) to install and configure desktop packages.

You can watch videos to see how to use it [here](https://www.youtube.com/playlist?list=PLytHgIKLV1caHlCrcTSkm5OF2WSVI1_Sq).

- - - 

- Then download the script with from the command line:

		curl -L archfi.sf.net/archfi > archfi

	- If SourceForge is down, use this instead:

		curl -L matmoul.github.io/archfi > archfi
- Finally, launch the script:

		sh archfi

- Then follow the on-screen instructions to completion.


# Partition the disks
- run *cfdisk* to get the partition table

- I always choose manual partition, and for this, i use **cfdisk**



```sh
cfdisk
```
```sh
                          Disk: /dev/sda
     Size: 931.51 GiB, 1000204886016 bytes, 1953525168 sectors
   Label: gpt, identifier: F650299F-86B9-4A56-960D-8263968CFD68

    Device         Start        End    Sectors  Size Type
>>  /dev/sda1       2048    2099199    2097152    1G EFI System    
    /dev/sda2  275804160 1953523711 1677719552  800G Linux ext4
    /dev/sda3    2099200   18552831   16453632  7.8G Linux swap
    /dev/sda4   18552832  102438911   83886080   40G Linux filesystem
    /dev/sda5  102438912  275804159  173365248 82.7G Linux filesystem

```
<!---
<img src="/home/hasib/Pictures/2020-11-04-10:35:46-screenshot.png" width="675" height="400">

![very good|512x397,20%](/home/hasib/Pictures/2020-11-04-10:35:46-screenshot.png =500x500)
-->
## After partition

Device|Size|Type|MOUNTPOINT
------|----|----|---
/dev/sda1|1G|EFI System|/boot
/dev/sda2|800G|Linux ext4
/dev/sda3|7.8G|Linux swap|[SWAP]
/dev/sda4|40G|Linux filesystem|/
/dev/sda5|82.7G|Linux filesystem|/home


## Format the partitions

		# mkfs.ext4 /dev/sda4
		# mkfs.ext4 /dev/sda5
		# mkswap /dev/sda3
		

## Mount the file systems

		# mount /dev/sda4 /mnt
		# swapon /dev/sda3

Last two steps and rest steps happend automatically by archfi script










## Configuration WM

Goto [EndeavourOS i3-wm](https://endeavouros.com/docs/window-tiling-managers/i3-wm/) official website,
 or goto [github_page](https://github.com/endeavouros-team/i3-EndeavourOS) for full instraction.

### Tutorial to install EndeavourOS-i3 setup from scratch
> for later installs, if you have installed another DE on initial install from the ISO

1. get the dot files
2. copy files to the right directories (.config of your user):
3. copy scripts inside ~/.config/i3/scripts must be executable ! [chmod +x] them please ;)
4. install needed packages

		git clone https://github.com/endeavouros-team/i3-EndeavourOS.git

		cd i3-EndeavourOS

		cp -R .config/* ~/.config/

		chmod -R +x ~/.config/i3/scripts (make scripts executable)

		cp .Xresources ~/ (needed colorcheme for menu)


## install needed apps and programms for i3wm:

		sudo pacman -S --needed - < packages-repository.txt



# Rest commands writen below copid from my .zsh_history, they need to be cleanedup.
## did i mention the zsh install process??
### who cares, tons of tut available in internate :)



### SETUP monitors

		nvim ~/.screenlayout/ONLY_LED.sh

Write:

		#!/bin/sh
		xrandr --output eDP1 --off --output HDMI1 --mode 1360x768 --pos 0x0 --rotate normal --output VIRTUAL1 --off

`mkdir -p ~/.config/autostart`

`nvim ~/.config/autostart/led_config.sh`

`chmod +x ~/.config/autostart/led_config.sh`

`chmod +x ~/.screenlayout/ONLY_LED.sh`

`sudo pacman -S gvfs polkit-gnome`

`sudo pacman -S pass`

check HDMI `cat /sys/class/drm/card0-HDMI-A-1/status`

`nvim /etc/systemd/logind.conf`

```sh

#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.
#
# Entries in this file show the compile time defaults.
# You can change settings by editing this file.
# Defaults can be restored by simply deleting this file.
#
# See logind.conf(5) for details.

[Login]
#NAutoVTs=6
#ReserveVT=6
#KillUserProcesses=no
#KillOnlyUsers=
#KillExcludeUsers=root
#InhibitDelayMaxSec=5
#HandlePowerKey=poweroff
HandleSuspendKey=suspend
#HandleHibernateKey=hibernate
HandleLidSwitch=suspend
#HandleLidSwitchExternalPower=suspend
HandleLidSwitchDocked=suspend
#PowerKeyIgnoreInhibited=no
#SuspendKeyIgnoreInhibited=no
#HibernateKeyIgnoreInhibited=no
#LidSwitchIgnoreInhibited=yes
HoldoffTimeoutSec=30s
IdleAction=hybrid-sleep
IdleActionSec=30min
#RuntimeDirectorySize=10%
#RuntimeDirectoryInodes=400k
#RemoveIPC=yes
#InhibitorsMax=8192
#SessionsMax=8192


```
- - -




```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \\
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```


`sudo nvim /etc/systemd/system/i3lock.service`


```sh
[Unit]
Description=i3lock on suspend
Before=sleep.target

[Service]
User=hasib
Type=forking
Environment=DISPLAY=:0
ExecStart=/usr/bin/i3lock -c 141414

[Install]
WantedBy=sleep.target
```

`sudo systemctl enable i3lock`

`sudo systemctl restart systemd-logind.service`

`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash`


```sh
mv .nvm ~/.config/nvm

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node
npm install -g neovim
```

```sh
sudo nvim /etc/X11/xorg.conf.d/00-keyboard.conf
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,bd"
        Option "XkbModel" "pc104"
        Option "XkbVariant" "qwerty,probhat"
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
```
```sh
sudo pacman -S kdeconnect
sudo pacman -S flashplugin
sudo pacman -S marker
sudo pacman -S qbittorrent
sudo pacman -S ranger
sudo pacman -S tk
sudo pacman -S python-pip
pip3 install --user jedi
```


## Make Softlink

Syntax

		ln -s source destination

For Example

		ln -s /home/hasib/Downloads /run/media/hasib/800_GB/Home/Arch/Downloads



Used in Download folder
		
		$ pwd
		/home/hasib

		$ ln -s /run/media/hasib/800GB_LN/Home/HomeCurrent/Downloads .

Check symblinks

		$ ls -l                                                       
		total 68
		drwxr-xr-x  2 hasib users  4096 Nov  2 16:44 Desktop
		drwxr-xr-x  2 hasib users  4096 Nov  2 16:44 Documents
		lrwxrwxrwx  1 hasib users    52 Nov  6 08:02 Downloads -> /run/media/hasib/800GB_LN/Home/HomeCurrent/Downloads
		drwxr-xr-x  4 hasib users  4096 Nov  2 16:48 IdeaProjects
		drwxr-xr-x  2 hasib users  4096 Nov  2 16:53 Music
		drwxr-xr-x  2 hasib users  4096 Nov  4 11:42 Pictures
		drwxr-xr-x  2 hasib users  4096 Nov  2 12:33 Public
		drwxr-xr-x  6 hasib users  4096 Nov  2 16:53 PycharmProjects
		drwxr-xr-x  2 hasib users  4096 Nov  2 12:33 Templates
		drwxr-xr-x  2 hasib users  4096 Nov  2 16:53 Videos
		drwxr-xr-x 16 hasib users  4096 Nov  3 08:57 Workstation
		drwxr-xr-x  4 hasib users  4096 Nov  2 12:52 i3-EndeavourOS
		-rw-r--r--  1 hasib users 11862 Nov  2 14:32 larbs.sh
		-rw-r--r--  1 hasib users  8240 Nov  3 22:28 packages



Unlink
		
		$ unlink Downloads 

