# The following lines were added by compinstall

<<<<<<< HEAD
zstyle ':completion:*' completer _expand _complete _ignored
=======
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**'
>>>>>>> origin/master
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
<<<<<<< HEAD
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
=======
SAVEHIST=5000
setopt autocd nomatch
unsetopt beep notify
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install
autoload -U colors && colors
export PATH=$PATH:/usr/local/go/bin:/home/alex/bin
export EDITOR=vim
export LC_ALL="en_US.utf-8"            # Fixes an encoding problem in tmux

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

>>>>>>> origin/master
## Aliases
# Reload this file
alias reload='source ~/.zshrc'

<<<<<<< HEAD
# Colorize less
alias less='less -R'

# Conveinence
alias e=vim
alias py.test3='python3 -m py.test'
alias vc='perl /home/alex/builds/vc-calc/vc/vc.pl'

# git
=======
# Colorize things
alias ls='ls --color'
alias grep='grep --color'
alias less='less -R'
alias pacman=pacman-color

# Convenience
alias e=vim
alias vc='perl /home/alex/builds/vc-calc/vc/vc.pl'

# Always update the database before running locate
alias locate='sudo updatedb && locate'

# Modify input devices
alias killmouse='synclient TouchpadOff=1'
alias raisemouse='synclient TouchpadOff=0'
alias dv='setxkbmap dvorak && xmodmap ~/.xmodmap'
alias qw='setxkbmap us && xmodmap ~/.xmodmap'

# Git
>>>>>>> origin/master
alias gst='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
<<<<<<< HEAD
=======

# Pacman
alias pacupg='sudo pacman-color -Syu'
alias pacsearch='pacman-color -Ss'
alias pacinstall='sudo pacman-color -S'
alias paclocal='sudo pacman-color -U'
alias pacrem='sudo pacman-color -R'
alias pacpurge='sudo pacman-color -Rns'
>>>>>>> origin/master
