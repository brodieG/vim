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

" edit source vim file easily

nnoremap <Leader>ve :edit $HOME/.vim/vimrc<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>

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

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
onoremap H ^
onoremap L $

set scrolloff=5

" highlight last inserted text

nnoremap gV `[v`]

" split and join lines

nnoremap <c-j> J
nnoremap <c-k> i<CR><ESC>

" TAB switches to previous buffer in normal, autocompletes in insert

nnoremap <TAB> :b#<CR>
inoremap <TAB> <c-n>
inoremap <S-Tab> <c-p>

" jk to exit interactive mode

inoremap jk <ESC>l

" auto braces; need to figure out better options for parens, quotes, etc

inoremap { {}<ESC>i

" Search settings:
"   unset the "last search pattern" register by hitting return
"   <Leader>s makes it easier to search / replace, or search alone, and also
"   takes advantage of pre-selected visual ranges

nnoremap <CR> :noh<CR>

set incsearch
set hlsearch

nnoremap <Leader>s :%s//gc<left><left><left>
vnoremap <Leader>s :s//gc<left><left><left>

nnoremap <Leader>S :s//g<left><left>
vnoremap <Leader>S :s//g<left><left>

nnoremap <Leader>g :grep * -r<left><left><left><left>
vnoremap <Leader>g :grep * -r<left><left><left><left>

" Plugins
" temporarily disable plugins
let g:pathogen_disabled = []
call add(g:pathogen_disabled,'R-Vim-runtime')

execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
augroup rmd
  autocmd!
  au BufNewFile,BufRead *.Rmd set filetype=Rmd
augroup END

nnoremap <Leader>t :CtrlPMixed<CR>
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_mruf_max = 0
" Clear CtrlP cache when coming back to vim and after writing a file.
augroup ctrpl
  autocmd!
  au FocusGained,BufWritePost * CtrlPClearCache
augroup END

let g:scratch_height = 0.5

" whitespace trimming; for now don't do it auto anymore to avoid issues with
" contributions to other repos

" augroup whitespace
"   autocmd!
"   autocmd FileType R,md,Rmd,js,css,c,h autocmd BufWritePre <buffer> StripWhitespace
" augroup END

nnoremap <Leader>x :StripWhitespace<CR>:write<CR>

" Appearance, etc, after plugins to override

set linebreak
set colorcolumn=81

set t_Co=256
set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermbg=3 ctermfg=black
hi Comment ctermfg=darkgrey

" linenumbers " http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" unfortunately focus/window events don't seem to work on mac terminal

set number
set relativenumber

augroup numbers
  autocmd!
  au FocusLost * set norelativenumber
  au FocusGained * set relativenumber
  au InsertEnter * set norelativenumber | set number
  au InsertLeave * set relativenumber
augroup END

" autosave and auto-reload; first saves whenever we lose focus leave, the
" other kicks off autoread (thanks fphilipe); seems like the focus events
" don't seem to work

augroup autosave
  autocmd!
  au InsertLeave * w
  " au FocusLost,WinLeave * silent! wa
  " au FocusGained,BufEnter * silent! !
augroup END
