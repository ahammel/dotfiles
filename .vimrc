""" Alex's .vimrc for asimov
" Last updated May 23, 2012
"
""" Plugins installed:
" nerd-commenter

""" Basics
set nocompatible     	    " Explicitly unset vi compatibility mode
set background=light 	    " Assume a light-coloured background
syntax on 		            " Syntax hilighting FTW
set showcmd                 " Echo pending commands to the bottom of the screen
runtime! ftplugin/man.vim   " :Man for man info
set autochdir               " dir is realtive to open buffer
set showmatch               " highlight matching parens
set nu                      " show line numbers by default
filetype plugin on          " required for nerdcommenter. magic
let mapleader = ","         " , for leader key

"""Backups
set backup
set backupdir=~/.vim/backup

""" 4-space autotabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

""" Keybindings
" F5 inserts current date
nnoremap <F5> "=strftime("%b %d, %Y")<CR>p
inoremap <F5> <C-R>=strftime("%b %d, %Y")<CR>

""" Misc hacks.
" w!! writes with sudo
cmap w!! w !sudo dd of=%
