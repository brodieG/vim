set expandtab
set shiftwidth=2
set softtabstop=2
set hidden
set ignorecase
set smartcase
set so=999
nnoremap / /\V
vnoremap / /\V
inoremap jk <ESC>
execute pathogen#infect()
syntax on
filetype plugin indent on
au BufNewFile,BufRead *.Rmd set filetype=Rmd
set linebreak
set colorcolumn=81
set number
