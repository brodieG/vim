set nocompatible
set hidden
set ignorecase
set smartcase
set laststatus=2
set wildmenu wildmode=longest:full,full
set showcmd
set backspace=2 " make backspace work like most other apps
set dir=~/.vimswap//,.,~/tmp,/var/tmp,/tmp
syntax on

" files to ignore, used right now for CtrlP

set wildignore+=*.o,*.so

" Folding

set foldenable
set foldmethod=indent
set foldlevelstart=10
hi Folded ctermbg=NONE ctermfg=darkgrey

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

nnoremap j gj
nnoremap k gk

set scrolloff=10

" highlight last inserted text

nnoremap gV `[v`]

" split and join lines

nnoremap <c-j> J
nnoremap <c-k> i<CR><ESC>

" TAB switches to previous buffer

nnoremap <TAB> :b#<CR>

" jk to exit interactive mode

inoremap jk <ESC>l

" Search settings
"   unset the "last search pattern" register by hitting return
"   search in very unmagic by default

nnoremap <CR> :noh<CR><CR>

set incsearch
set hlsearch

nnoremap / /\V
vnoremap / /\V

" Plugins

execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
au BufNewFile,BufRead *.Rmd set filetype=Rmd

nnoremap <Leader>t :CtrlPMixed<CR>
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_mruf_max = 0
" Clear CtrlP cache when coming back to vim and after writing a file.
au FocusGained,BufWritePost * :CtrlPClearCache

let g:scratch_height = 0.5

" whitespace trimming

autocmd FileType R,md,Rmd,js,css,c,h autocmd BufWritePre <buffer> StripWhitespace

" Appearance, etc, after plugins to override

set linebreak
set colorcolumn=81
set number

set t_Co=256
set number
set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermbg=3 ctermfg=black
hi Comment ctermfg=darkgrey

" autosave and auto-reload; first saves whenever we lose focus leave, the
" other kicks off autoread (thanks fphilipe)

au FocusLost,WinLeave * :silent! wa
au FocusGained,BufEnter * :silent! !
