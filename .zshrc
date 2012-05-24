# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt autocd nomatch
unsetopt appendhistory beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
autoload -U colors && colors
export PATH=$PATH:/usr/local/go/bin
export EDITOR=vim
export LC_ALL="en_US.utf-8"            # Fixes an encoding problem in tmux

# Prompt settings
PROMPT='┌─────%{%F{green}%}[%n@%m]%{%F{blue}%} (%c) %{%f%}
└─╼ '

# ssh-agent
eval $(ssh-agent) > /dev/null

# Aliases
alias ls='ls --color'
alias grep='grep --color'
alias e=vim
alias calc='Rscript -e'
alias abstree='find /var/abs'
alias pacman=pacman-color
alias killmouse='synclient TouchpadOff=1'
alias raisemouse='synclient TouchpadOff=0'
alias upgrade='sudo pacman -Syu; echo "\nyaourt:\n" ;yaourt -Sua'

alias gst='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
