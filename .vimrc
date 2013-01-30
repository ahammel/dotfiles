""" Alex's .vimrc for asimov
" Last updated Nov 17, 2012
"

""" Basics
set nocompatible     	    " Explicitly unset vi compatibility mode
set background=light 	    " Assume a light-coloured background
syntax on 		            " Syntax hilighting FTW
set showcmd                 " Echo pending commands to the bottom of the screen
runtime! ftplugin/man.vim   " :Man for man info
set autochdir               " dir is realtive to open buffer
set showmatch               " highlight matching parens
set nu                      " show line numbers by default
let mapleader = ","         " , for leader key
set nohlsearch              " Turn off search highlighting
set hidden                  " Allow buffers to be hidden with unsaved changes

"""Vundle
filetype off                " required!
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'garbas/vim-snipmate.git'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'vim-scripts/tlib.git'
Bundle 'jcfaria/Vim-R-plugin.git'
Bundle 'vim-scripts/donbass.vim'
Bundle 'c9s/bufexplorer'
Bundle 'tpope/vim-fugitive.git'

filetype plugin indent on   " required! 

""" Bundle configuration
" No screenplugin required for R plugin
let vimrplugin_screenplugin = 0

""" Backups
set backup
set backupdir=~/.vim/backup

""" 4-space autotabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

""" Filetype-specific settings
"" Makefiles
autocmd FileType make setlocal noexpandtab
"" Ruby
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

""" Keybindings
" F5 inserts current date
nnoremap <F5> "=strftime("%b %d, %Y")<CR>p
inoremap <F5> <C-R>=strftime("%b %d, %Y")<CR>

" Once sentence per line in the current paragraph
nnoremap <F6> vip:s/\.  \+/.\r/g<CR>vip:s/\([^\.]\)\n/\1 /g<CR>

""" Misc hacks.
" w!! writes with sudo
cmap w!! w !sudo dd of=%
" New files open with template
" Hack courtesy: http://vim.runpaint.org/typing/using-templates/
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
