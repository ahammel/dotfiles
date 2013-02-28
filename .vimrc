""" Alex's .vimrc for asimov
" Last updated Feb 27, 2013
"

""" Basics
set nocompatible     	    " Explicitly unset vi compatibility mode
syntax on 		            " Syntax hilighting FTW
set showcmd                 " Echo pending commands to the bottom of the screen
runtime! ftplugin/man.vim   " :Man for man info
set autochdir               " dir is realtive to open buffer
set showmatch               " highlight matching parens
set nu                      " show line numbers by default
let mapleader = ","         " , for leader key
set nohlsearch              " Turn off search highlighting
set hidden                  " Allow hidden buffers

"""Vundle
filetype off                " required!
set rtp+=~/.vim/bundle/vundle
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
Bundle 'flazz/vim-colorschemes.git'
Bundle 'c9s/bufexplorer'
Bundle 'tpope/vim-fugitive.git'

filetype plugin indent on   " required! 

""" Bundle configuration
" No screenplugin required for R plugin
let vimrplugin_screenplugin = 0

""" Statusline configuration
set laststatus=2                            " Turn it on
set statusline=%t                           " Tail of filename
set statusline+=%m                          " Modified flag
set statusline+=%=                          " Left/right separator
set statusline+=%c,                         " Cursor column
set statusline+=%l/%L                       " Cursor line / total lines
set statusline+=\ %{fugitive#statusline()}  " Git branch

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
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2

"" Latex
" Default to LaTeX if not otherwise specified
let g:tex_flavor = "latex"

""" Keybindings
" F4 strips trailing whitespace
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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
