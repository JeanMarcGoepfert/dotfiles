set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'rking/ag.vim'
Plug 'junegunn/fzf'
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdtree'
Plug 'lifepillar/vim-solarized8'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'mxw/vim-jsx'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'leafgarland/typescript-vim'
Plug 'sbdchd/neoformat', "install prettier globally if you want js
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'burner/vim-svelte'
Plug 'rust-lang/rust.vim'
call plug#end()

let g:go_fmt_command = "goimports"

filetype plugin indent on

syntax enable
syntax on
set termguicolors
set background=dark
colorscheme solarized8

"copy to system clipboard
set clipboard=unnamed
set noshowmode
set number
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set statusline+=%F
set laststatus=2
set showcmd
set incsearch
set laststatus=2
set autowrite
set splitbelow
set splitright
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set viminfo^=%
set modelines=0
set ttyfast
set scrolloff=5
set ignorecase
set smartcase
set showmatch
set nohlsearch
set hidden
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set rtp+=~/.fzf
set shell=/bin/sh
set foldmethod=indent

let javascript_enable_domhtmlcss = 1

let g:rustfmt_autosave = 1

let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1

let mapleader = "\<Space>"

imap <C-j> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<c-l>'
let g:coc_snippet_prev = '<c-h>'

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>t :NERDTree<CR>
nnoremap <Leader>p :FZF<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>r :redo<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :vs<CR>
nnoremap <Leader>v :sp<CR>
nnoremap <Leader>b :bprevious<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>e :lopen<CR>

inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

" Return to last edit position when opening files
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif

"remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

" set tsx/jsx file types for coc-tsserver to work
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

let g:lightline = {
  \ 'colorscheme': 'solarized'
  \ }

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

vmap <silent> <expr> p <sid>Repl()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Keep all folds open when a file is opened
"augroup OpenAllFoldsOnFileOpen
"    autocmd!
"    autocmd BufRead * normal zR
"augroup END

set nofoldenable

command P Neoformat

" cp to copy current path
:nmap cp :let @+ = expand("%")<cr>

syntax on
autocmd! bufreadpost *.md set syntax=off
