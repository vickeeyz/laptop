laptop
======

First, make sure curl is installed:

    sudo apt-get update
    sudo apt-get -y install curl

For Ubuntu (server and desktop):

    bash <(curl -s https://raw.githubusercontent.com/zhiyuanshi/laptop/master/ubuntu.sh) 2>&1 | tee ~/laptop.log

Extras for Ubuntu desktop:

    bash <(curl -s https://raw.githubusercontent.com/zhiyuanshi/laptop/master/ubuntu-desktop.sh) 2>&1 | tee ~/laptop-desktop.log

Inspired by: https://github.com/thoughtbot/laptop