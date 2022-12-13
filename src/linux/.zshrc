bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

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

alias gst='git status'
alias gpl='git pull --rebase'
alias gph='git push && git push --tags'
alias gcmt='git commit'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000