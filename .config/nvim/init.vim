" CONFIG ---------------------------------------------------------------- {{{
let g:python3_host_prog = '/sbin/python'
filetype plugin indent on
syntax on
scriptencoding utf-8

let mapleader = "\<Space>"
let $LANG='es'
set langmenu=es

set autowrite
set autowriteall
set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore
set history=1000
set foldmethod=marker
set ruler
set hidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set nowrap
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set tm=500
syntax enable
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=120
set ai
set si
set number
set relativenumber
set termguicolors
colorscheme base16-materia
" colorscheme relax
hi Folded ctermbg=grey
hi Normal guibg=NONE ctermbg=NONE
set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣,multispace:---\|
set list
" }}}

" MAPPINGS --------------------------------------------------------------- {{{

let mapleader = "\<Space>"
let maplocalleader = "."

map <silent> <leader><cr> :noh<cr>
imap jk <Esc>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader>w :wall<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader><esc> :qall!<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>. :cnext<CR>
nnoremap <leader>, :cprevious<CR>
nnoremap <leader>- :cclose<CR>

vnoremap < <gv
vnoremap > >gv
nmap <leader>bd :bp!\|bd!#<CR>

" }}}

" VARIABLES {{{
let g:nvimPathConfig = '~/.config/nvim/config.d/'
" }}}

lua require("luasnip.loaders.from_snipmate").lazy_load()

source ~/.config/nvim/config.d/functions.vim

call VimConfig('base')

call LoadProjectVimrc()
"
