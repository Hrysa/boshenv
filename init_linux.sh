#!/bin/sh

sudo apt install -y zsh

chsh -s /usr/bin/zsh

sudo -E wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

rm -rf ~/.oh-my-posh
mkdir ~/.oh-my-posh
cp src/mojo.omp.json ~/.oh-my-posh/mojo.omp.json

cp src/linux/.zshrc ~/.zshrc

rm -rf ~/.zsh_plugins
mkdir -p ~/.zsh_plugins/zsh-autocomplete
git config --global https.proxy $https_proxy
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh_plugins/zsh-autocomplete
git config --global --unset https.proxy