#!/bin/sh

os=$(uname)

if [ "FreeBSD" = "$os" ]; then
    sudo pkg install -y zsh vim git
fi

if [ "Linux" = "$os" ]; then
    sudo apt install -y zsh vim git
fi

sh _init_zsh.sh