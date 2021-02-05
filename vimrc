set nocompatible
set hidden
set ignorecase
set smartcase
set laststatus=2
set wildmenu wildmode=longest:full,full
set showcmd
set backspace=2 " make backspace work like most other apps
set dir=~/.vimswap//,.,~/tmp,/var/tmp,/tmp

" syntax

syntax on
augroup syntax
  au!
  au BufEnter * syntax sync minlines=1000
augroup END

" Allow selecting past end of line

set virtualedit=block

" files to ignore, used right now for CtrlP

set wildignore+=*.o,*.so

" Folding

set foldenable
set foldmethod=indent
set foldlevelstart=10

" Indentation and spacing

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set indentkeys-=0#

au BufEnter *.{c,h} setlocal noexpandtab
au BufEnter *.{c,h} setlocal shiftwidth=4
au BufEnter *.{c,h} setlocal softtabstop=4

au BufEnter *.{r,R} setlocal shiftwidth=2
au BufEnter *.{r,R} setlocal softtabstop=2

" timouts in reasonable amout of time

set timeout timeoutlen=2000
set ttimeout ttimeoutlen=0

" Map leader to <SPACE>

let mapleader = "\<Space>"
nnoremap <Space> <Nop>

" Select inside curly braces

nnoremap <Leader><Space> vi{
vnoremap <Leader><Space> i{

" Insert remove spaces

nnoremap <Leader>o o<ESC>k
nnoremap <Leader>O O<ESC>j

" Call Rex

nnoremap <Leader>r :Rex<CR>

" Open current directory

nnoremap <Leader>h :e %:h

" Text wrap in paragraph

nnoremap <Leader>q gqip

" edit source vim file easily

nnoremap <Leader>ve :edit $HOME/.vim/vimrc<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>

" to avoid accidentally hitting ZZ instead of zz

nnoremap ZZ <Nop>

" copy paste to system clipboard

nnoremap Y "+Y
nnoremap y "+y
nnoremap <Leader>P "+P
nnoremap <Leader>p "+p

vnoremap Y "+Y
vnoremap y "+y
vnoremap <Leader>P "+P
vnoremap <Leader>p "+p

" Better motion

nnoremap J <c-d>
nnoremap K <c-u>

vnoremap J <c-d>
vnoremap K <c-u>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap H g^
nnoremap L g$
vnoremap H g^
vnoremap L g$
onoremap H g^
onoremap L g$

set scrolloff=5

" Better insert mode entry

nnoremap <Leader>a ea
nnoremap <Leader>A Ea

" highlight last inserted text

nnoremap gV `[v`]

" split and join lines

nnoremap <c-j> J
nnoremap <c-k> i<CR><ESC>

" Clear a line

nnoremap <Leader>d cc<ESC>

" TAB switches to previous buffer in normal, autocompletes in insert

nnoremap <TAB> :b#<CR>
inoremap <TAB> <c-n>
inoremap <S-Tab> <c-p>

" jk to exit interactive mode

inoremap jk <ESC>l
" inoremap kj <ESC>l

" auto braces; need to figure out better options for parens, quotes, etc

inoremap { {}<ESC>i

" Increase and decrease pane size

nnoremap <Leader>= <c-w>+
nnoremap <Leader>- <c-w>-

" Search settings:
"   unset the "last search pattern"
"   <Leader>s makes it easier to search / replace, or search alone, and also
"   takes advantage of pre-selected visual ranges

nnoremap <Leader>c :noh<CR>

set incsearch
set hlsearch

" Clear search highlighting once we enter insert mode

augroup clearsearch
  autocmd!
  au InsertEnter * setlocal nohlsearch
  au InsertLeave * setlocal hlsearch
augroup END

nnoremap <Leader>s q:i%s//gc<left><left><left>
vnoremap <Leader>s q:is//gc<left><left><left>

nnoremap <Leader>S q:is//g<left><left>
vnoremap <Leader>S q:is//g<left><left>

" Grep excluding binaries and git/svn

nnoremap <Leader>G yiwq:igrep <ESC>pa  -rI --exclude-dir=.git --exclude-dir=.svn<ESC>3Bhi
nnoremap <Leader>g q:igrep  -rI --exclude-dir=.git --exclude-dir=.svn<ESC>3Bhi
vnoremap <Leader>g q:igrep  -rI --exclude-dir=.git --exclude-dir=.svn<ESC>3Bhi

" Easy save

nnoremap <Leader>w :w<CR>

" Plugins ----------------------------------------------------------------------

" temporarily disable plugins
let g:pathogen_disabled = []
call add(g:pathogen_disabled,'R-Vim-runtime')
call add(g:pathogen_disabled,'Nvim-R')
call add(g:pathogen_disabled,'nerdtree')
call add(g:pathogen_disabled,'vim-markdown')
call add(g:pathogen_disabled,'vim-ctrlspace')

" Nvim-R variables

let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_assign = 0

" vim-markdown-folding

execute pathogen#infect()
execute pathogen#helptags()
if has("autocmd")
  filetype plugin indent on
endif
augroup rmd
  autocmd!
  au BufNewFile,BufRead *.Rmd set filetype=Rmd
  au BufNewFile,BufRead *.Rmd setlocal spell
augroup END
augroup md
  autocmd!
  au BufNewFile,BufRead *.md setlocal spell
  au BufNewFile,BufRead *.md set filetype=markdown
augroup END
augroup txt
  autocmd!
  au BufNewFile,BufRead *.txt setlocal spell
augroup END

nnoremap <Leader>t :CtrlPMixed<CR>
let g:ctrlp_by_filename = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_mruf_max = 0
" Clear CtrlP cache when coming back to vim and after writing a file.
" augroup ctrpl
"   autocmd!
"   au FocusGained,BufWritePost * CtrlPClearCache
" augroup END

let g:scratch_height = 0.5

" Whitespace
"
" Used to auto-trim

" augroup whitespace
"   autocmd!
"   autocmd FileType R,md,Rmd,js,css,c,h autocmd BufWritePre <buffer> StripWhitespace
" augroup END

nnoremap <Leader>x :StripWhitespace<CR>:write<CR>

" show tabs

set list
set listchars=tab:>-

" Appearance, etc, after plugins to override, note that we force wrap comments
" but not normal text

colorscheme default
set linebreak
set colorcolumn=81
set ruler
set textwidth=80
set formatoptions=cqro

set t_Co=256
set cursorline
hi cursorline cterm=none
hi cursorlinenr ctermbg=3 ctermfg=black
hi Comment ctermfg=darkgrey
hi SpecialComment ctermfg=grey
" hi SpecialComment cterm=underline
hi Search cterm=none ctermbg=3

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

nnoremap <Leader>nn :set norelativenumber<CR>:set nonumber<CR>

" spelling

hi clear SpellBad
hi SpellBad cterm=reverse

" markdown folding

function! MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction

au BufEnter *.{md,Rmd} setlocal foldexpr=MarkdownLevel()
au BufEnter *.{md,Rmd} setlocal foldmethod=expr


