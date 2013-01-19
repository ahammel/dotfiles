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
unsetopt beep notify
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install
autoload -U colors && colors
export PATH=$PATH:/usr/local/go/bin:/home/alex/bin:/home/alex/.gem/ruby/1.9.1/bin
export EDITOR=vim
export LC_ALL="en_US.utf-8"            # Fixes an encoding problem in tmux
export SHELL=zsh

# Prompt settings
PROMPT='%
┌─────%{%F{green}%}[%n@%m]%{%F{blue}%} (%c) %{%f%}
└─╼ '

# ssh-agent
eval $(ssh-agent) > /dev/null

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
alias ls='ls --color'
alias grep='grep --color'
alias less='less -R'
alias pacman=pacman-color

# Convenience
alias e=vim
alias vc='perl /home/alex/builds/vc-calc/vc/vc.pl'
alias py.test2='python2 -m pytest'

# Always update the database before running locate
alias locate='sudo updatedb && locate'

# Modify input devices
alias killmouse='synclient TouchpadOff=1'
alias raisemouse='synclient TouchpadOff=0'
alias dv='setxkbmap dvorak && xmodmap ~/.xmodmap'
alias qw='setxkbmap us && xmodmap ~/.xmodmap'

# Git
alias gst='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '

# Pacman
alias aurupg='rm *.pkg.tar.xz && makepkg -s && paclocal *.pkg.tar.xz'
alias pacupg='sudo pacman-color -Syu'
alias pacsearch='pacman-color -Ss'
alias pacinstall='sudo pacman-color -Syu'
alias paclocal='sudo pacman-color -U'
alias pacrem='sudo pacman-color -R'
alias pacpurge='sudo pacman-color -Rns'
