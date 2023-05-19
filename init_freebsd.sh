#!/bin/sh

sudo pkg install -y zsh vim starship git

chsh -s /usr/local/bin/zsh

sh _init_zsh.sh