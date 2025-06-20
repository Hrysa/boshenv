install_zsh_plugin()
{
    mkdir -p $zsh_autocomplete_dir
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh_plugins/zsh-autocomplete
}

mkdir -p ~/.config

# place all config files
cp src/zsh/.zshrc ~/.zshrc
cp src/vimrc.vim ~/.vimrc

zsh_autocomplete_dir="$HOME/.zsh_plugins/zsh-autocomplete"
if [ -d "$zsh_autocomplete_dir" ]; then
    echo -n 'zsh_autocomplete already exist, replace? (y/N)'

    read replace
    if [ "y" = "$replace" ]; then
        rm -rf $zsh_autocomplete_dir
        install_zsh_plugin
    fi
else
    install_zsh_plugin
fi

if [ "$(basename $SHELL)" != "zsh" ]; then
    chsh -s $(which zsh)
fi