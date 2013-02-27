# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install

# Syntax highlighting in less!
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"


autoload -U promptinit && promptinit
prompt redhat

export PATH="$PATH:/home/alex/Applications/ncbi-blast-2.2.26+/bin/"
export PATH="$PATH:/home/alex/Applications/firefox"
export PATH="$PATH:/home/alex/bin"
export PATH="$PATH:/usr/local/pgsql/bin"
export PATH="$PATH:/home/alex/builds/clustalw-2.1-linux-x86_64-libcppstatic"

export GIT_EDITOR=vim
export EDITOR=vim

# Enable term colour support
export TERM='rxvt-unicode-256color'

# coloured man pages, courtesy the Arch wiki
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;34m") \
        man "$@"
}

# source highlighting in less!
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"

## Aliases
# Reload this file
alias reload='source ~/.zshrc'

# Colorize things
alias less='less -R'
alias tree='tree -C'

# Conveinence
alias e=vim
alias py.test3='python3 -m py.test'
alias vc='perl /home/alex/builds/vc-calc/vc/vc.pl'

# git
alias gst='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
