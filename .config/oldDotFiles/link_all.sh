#! /bin/sh

#if [ $(pwd) = "/home/$USER" ];
#then
#	echo "proceed"
#else
#	echo "In Wrong directory."
#	echo "You should be in /home/$USER"
#	echo "I can change the dir, should i?[y/n]"
#	read input
#	case ${input,,} in
#		'y' ) 	echo -e "$ pwd \n$(pwd)\ncd ~"
#			cd ~
#			echo -e "$ pwd\n$(pwd)"
#			;;
#		'n' ) echo "exiting.."
#			exit 1
#			;;
#	esac
#fi
#

echo '- - - - - - - - - - - - - - - - - - - - - -'
echo '- - - - - - - - - - START - - - - - - - - -'
echo '- - - - - - - - - - - - - - - - - - - - - -'


# .                .ssh          Music            i3-EndeavourOS
# ..               .zshrc        Pictures         larbs.sh
# .config          Desktop       PycharmProjects  packages
# .gitconfig       Documents     Templates
# .gnupg           Downloads     Videos
# .password-store  IdeaProjects  Workstation



SOURCE_PREFIX=/run/media/$USER/800GB_LN/Home/HomeCurrent
# SOURCE_PREFIX=test/mytest/sourcetest

echo -e "
##########LOOK CAREFULLY#############
Source : $SOURCE_PREFIX
###########P L E A S E###############
Files available in $SOURCE_PREFIX
"
ls -alh $SOURCE_PREFIX
ls -a $SOURCE_PREFIX | wc -l

# :%s/# echo "ln -s /# ln -s $/gc

# echo "ln -s $SOURCE_PREFIX/ /home/$USER/"
# ln -s $SOURCE_PREFIX/ /home/$USER/

echo "ln -s $SOURCE_PREFIX/.gnupg /home/$USER/.gnupg"
# ln -s $SOURCE_PREFIX/.gnupg /home/$USER/.gnupg

echo "ln -s $SOURCE_PREFIX/.password-store /home/$USER/.password-store"
# ln -s $SOURCE_PREFIX/.password-store /home/$USER/.password-store

echo "ln -s $SOURCE_PREFIX/.ssh /home/$USER/.ssh"
# ln -s $SOURCE_PREFIX/.ssh /home/$USER/.ssh

# CURRENTLY, do it manually
# ln -s $$SOURCE_PREFIX/.config /home/$USER/.config"
# ln -s $SOURCE_PREFIX/.config /home/$USER/.config

echo "ln -s $SOURCE_PREFIX/.zshrc /home/$USER/.zshrc"
# ln -s $SOURCE_PREFIX/.zshrc /home/$USER/.zshrc

echo "ln -s $SOURCE_PREFIX/.gitconfig /home/$USER/.gitconfig"
# ln -s $SOURCE_PREFIX/.gitconfig /home/$USER/.gitconfig

echo "ln -s $SOURCE_PREFIX/Desktop /home/$USER/Desktop"
# ln -s $SOURCE_PREFIX/Desktop /home/$USER/Desktop

echo "ln -s $SOURCE_PREFIX/Documents /home/$USER/Documents"
# ln -s $SOURCE_PREFIX/Documents /home/$USER/Documents

echo "ln -s $SOURCE_PREFIX/Downloads /home/$USER/Downloads"
sleep 2
ln -s $SOURCE_PREFIX/Downloads /home/$USER/Downloads

echo "ln -s $SOURCE_PREFIX/IdeaProjects /IdeaProjects"
# ln -s $SOURCE_PREFIX/IdeaProjects /IdeaProjects

echo "ln -s $SOURCE_PREFIX/Music /home/$USER/Music"
# ln -s $SOURCE_PREFIX/Music /home/$USER/Music

echo "ln -s $SOURCE_PREFIX/Pictures /home/$USER/Pictures"
# ln -s $SOURCE_PREFIX/Pictures /home/$USER/Pictures

echo "ln -s $SOURCE_PREFIX/Public /home/$USER/Public"
# ln -s $SOURCE_PREFIX/Public /home/$USER/Public

echo "ln -s $SOURCE_PREFIX/PycharmProjects /home/$USER/PycharmProjects"
# ln -s $SOURCE_PREFIX/PycharmProjects /home/$USER/PycharmProjects

echo "ln -s $SOURCE_PREFIX/Templates /home/$USER/Templates"
# ln -s $SOURCE_PREFIX/Templates /home/$USER/Templates

echo "ln -s $SOURCE_PREFIX/Videos /home/$USER/Videos"
# ln -s $SOURCE_PREFIX/Videos /home/$USER/Videos

echo "ln -s $SOURCE_PREFIX/Workstation /home/$USER/Workstation"
# ln -s $SOURCE_PREFIX/Workstation /home/$USER/Workstation

echo "ln -s $SOURCE_PREFIX/i3-EndeavourOS /home/$USER/i3-EndeavourOS"
# ln -s $SOURCE_PREFIX/i3-EndeavourOS /home/$USER/i3-EndeavourOS


