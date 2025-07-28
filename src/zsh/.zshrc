setopt INTERACTIVE_COMMENTS

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# 
if [[ "`uname`" == "Linux" ]]; then
    os_name=`lsb_release -a`
    if [[ "$os_name" = *"Debian"* ]]; then
        system_icon=" "
    elif [[ "$os_name" = *"Ubuntu"* ]]; then
        system_icon=" "
    fi
elif [[ "`uname`" == "FreeBSD" ]]; then
    system_icon=" "
elif [[ "`uname`" == "Darwin" ]]; then
    system_icon=" "
fi

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='${system_icon}%F{white}%*%f %F{cyan}%~%f %F{red}${vcs_info_msg_0_}%f'
PROMPT='${system_icon}%*%f %F{cyan}%~%f %F{red}${vcs_info_msg_0_}%f'

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
alias gcmt='git commit -m'

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


[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
