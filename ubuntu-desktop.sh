#!/usr/bin/env bash

set -e

# Base16 for Gnome Terminal
curl -L https://raw.githubusercontent.com/chriskempson/base16-gnome-terminal/master/base16-mocha.light.sh | bash

# Dropbox

# Google Chrome

# GVim
sudo apt-get -y install vim-gnome

# gitg
# sudo apt-get -y install gitg

# SmartGit/Hg
smartgit_version=6_5_1
smartgit_filename=smartgit-${smartgit_version}.deb
wget -P /tmp http://www.syntevo.com/download/smartgit/${smartgit_filename}
sudo dpkg -i /tmp/${smartgit_filename}

# Sublime Text 3

# "Open in Terminal"
sudo apt-get -y install nautilus-open-terminal

# VirtualBox
#
# Ubuntu/Debian users might want to install the dkms package to ensure that the
# VirtualBox host kernel modules (vboxdrv, vboxnetflt and vboxnetadp) are
# properly updated if the linux kernel version changes during the next apt-get
# upgrade.
#
# https://www.virtualbox.org/wiki/Linux_Downloads
sudo apt-get -y install virtualbox
sudo apt-get -y install dkms

# Android Studio
if [[ -f /usr/local/android-studio/bin/studio.sh ]]
then
  sudo ln -s --force /usr/local/android-studio/bin/studio.sh /usr/local/bin/android-studio
fi
