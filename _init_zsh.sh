mkdir -p ~/.config
cp src/starship.toml ~/.config

cp src/zsh/.zshrc ~/.zshrc
cp src/vimrc.vim ~/.vimrc

rm -rf ~/.zsh_plugins
mkdir -p ~/.zsh_plugins/zsh-autocomplete
git config --global https.proxy $https_proxy
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh_plugins/zsh-autocomplete
git config --global --unset https.proxy