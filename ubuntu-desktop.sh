#!/usr/bin/env bash

set -e

whereiwas=$(pwd)

# Base16 for Gnome Terminal
curl -L https://raw.githubusercontent.com/chriskempson/base16-gnome-terminal/master/base16-mocha.light.sh | bash

# Dropbox

# Google Chrome

# GVim
sudo apt-get -y install vim-gnome

# gitg
# sudo apt-get -y install gitg

# SmartGit/Hg

# Sublime Text 3

# "Open in Terminal"
sudo apt-get -y install nautilus-open-terminal

# IntelliJ IDEA
intellij_tar_file=ideaiu-14.tar.gz
intellij_dir_name=idea-IU-139.224.1

cd /tmp
curl -O http://download-cf.jetbrains.com/idea/$intellij_tar_file
tar xfz $intellij_tar_file

sudo mkdir -p /usr/local/intellj
sudo mv $intellj_dir_name /usr/local/intellj

sudo ln -s --force /usr/local/intellj/$intellj_dir_name/bin/idea.sh /usr/local/bin/idea
cd "$whereiwas"

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
