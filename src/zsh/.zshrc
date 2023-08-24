setopt INTERACTIVE_COMMENTS

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

eval "$(starship init zsh)"

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
alias ll='ls -aGlF'
alias la='ls -AG'
alias l='ls -GCF'

alias gst='git status'
alias gpl='git pull --rebase'
alias gph='git push && git push --tags'
alias gcmt='git commit'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000

# kubernetes
alias k='kubectl'
function kn()
{
    kubectl $@ -n $(basename `pwd`)
}

proxy()
{
    if [ -f "$HOME/.config/proxy_url" ]; then
        proxy_url=$(cat $HOME/.config/proxy_url)
    fi

    if [ "$proxy_url" = "" ]; then
        echo -n "no proxy set, input new one: "
        read proxy_url
        echo $proxy_url > $HOME/.config/proxy_url
    fi
    echo using proxy $proxy_url
    http_proxy=$proxy_url https_proxy=$proxy_url $@
}


function set_term_title()
{
    echo -n -e "\033]0;$USER@$HOST\007"
}

unset -f ssh 2>/dev/null
raw_ssh=$(which ssh)
function ssh()
{
    $raw_ssh $@; set_term_title
}

set_term_title
