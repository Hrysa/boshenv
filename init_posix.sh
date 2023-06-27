#!/bin/sh

os=$(uname)

if [ "FreeBSD" = "$os" ]; then
    sudo pkg install -y zsh vim starship git
fi

if [ "Linux" = "$os" ]; then
    sudo apt install -y zsh vim git curl
    curl -sS https://starship.rs/install.sh | sh
fi

sh _init_zsh.sh