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

autoload -U promptinit && promptinit
prompt redhat

export GIT_EDITOR=vim
export EDITOR=vim

## Aliases
# Reload this file
alias reload='source ~/.zshrc'

# Colorize things
alias less='less -R'
alias tree='tree -C'

# Conveinence
alias e=vim

# git
alias gst='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
