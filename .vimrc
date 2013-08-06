""" Alex's .vimrc for mobile
" Last updated Aug 06, 2013
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

""" Statusline configuration
set laststatus=2                            " Turn it on
set statusline=%t                           " Tail of filename
set statusline+=%m                          " Modified flag
set statusline+=%=                          " Left/right separator
set statusline+=%c,                         " Cursor column
set statusline+=%l/%L                       " Cursor line / total lines

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
" Proper tabs
autocmd FileType make setlocal noexpandtab

"" Ruby
" Two-space tabs
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2

"" Latex
" Default to LaTeX if not otherwise specified
let g:tex_flavor = "latex"
" Wrap text
autocmd FileType tex setlocal wrap linebreak textwidth=0

"" Text
" Wrap text
autocmd FileType text setlocal wrap linebreak textwidth=0

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
