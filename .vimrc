set nocompatible

" Tab Stuff
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Highlighting
syntax on

" Search Stuff
set nohlsearch
set ignorecase
set smartcase

set background=dark
colorscheme murphy

" Mouse Support
set mouse=a

" Typo Resistance
command W w
command Wq wq

" Window Navigation
nnoremap <C-Tab> <C-w>w
nnoremap <C-S-Tab> <C-w>W

nmap q <esc>:q<enter>
command Q qall

filetype plugin on
