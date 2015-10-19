set hidden
set ignorecase
set smartcase
set laststatus=2
set wildmenu
set showcmd
set backspace=2 " make backspace work like most other apps
set dir=~/.vimswap//,.,~/tmp,/var/tmp,/tmp

" Indentation and spacing

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" timouts in reasonable amout of time

set timeout timeoutlen=1000
set ttimeout ttimeoutlen=100

" Map leader to <SPACE>

let mapleader = "\<Space>"
nnoremap <Space> <Nop>

" to avoid accidentally hitting ZZ instead of zz

nnoremap ZZ <Nop>

" copy paste to system clipboard

nnoremap <Leader>Y "+Y
nnoremap <Leader>y "+y
nnoremap <Leader>P "+P
nnoremap <Leader>p "+p

vnoremap <Leader>Y "+Y
vnoremap <Leader>y "+y
vnoremap <Leader>P "+P
vnoremap <Leader>p "+p

" Better motion

nnoremap J <c-d>
nnoremap K <c-u>

vnoremap J <c-d>
vnoremap K <c-u>

" split and join lines

nnoremap <c-j> J
nnoremap <c-k> i<CR><ESC>

" TAB switches to previous buffer

nnoremap <TAB> :b#<CR>

" search in very unmagic by default

nnoremap / /\V
vnoremap / /\V

" jk to exit interactive mode 

inoremap jk <ESC>

" Search settings
" This unsets the "last search pattern" register by hitting return

nnoremap <CR> :noh<CR><CR>

set incsearch
set hlsearch

execute pathogen#infect()
syntax on
filetype plugin indent on
au BufNewFile,BufRead *.Rmd set filetype=Rmd
set linebreak
set colorcolumn=81
set number

autocmd FileType R,md,Rmd,js,css,c autocmd BufWritePre <buffer> StripWhitespace

" highlight gutter

set t_Co=256
set number
set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermbg=3 ctermfg=black
hi Comment ctermfg=darkgrey

