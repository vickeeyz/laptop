#!/usr/bin/env bash

# Base16 for Gnome Terminal
curl -L https://raw.githubusercontent.com/chriskempson/base16-gnome-terminal/master/base16-mocha.light.sh | bash

# Dropbox

# Google Chrome

# GVim
sudo apt-get -y install vim-gnome

# SmartGit/Hg

# Sublime Text 3

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