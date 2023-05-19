#!/bin/sh

sudo apt install -y zsh vim git curl
curl -sS https://starship.rs/install.sh | sh

chsh -s /usr/bin/zsh

sh _init_zsh.sh