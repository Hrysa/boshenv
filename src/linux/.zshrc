# enable oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/mojo.omp.json )"
source ~/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# commands alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000