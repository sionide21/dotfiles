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

" Alternate macro key alt-q
" On a mac this could be escape, meta, or option depending on terminal config
nnoremap <M-q> q
nnoremap <Esc>q q
nnoremap œ q


" Just plain q quits
nnoremap q <esc>:q<enter>
command Q qall

filetype plugin on
