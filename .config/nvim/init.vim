set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'rking/ag.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'mxw/vim-jsx'
Plugin 'Raimondi/delimitMate'
Plugin 'easymotion/vim-easymotion'
Plugin 'w0rp/ale'
Plugin 'Shougo/deoplete.nvim'
Plugin 'SirVer/ultisnips'
call vundle#end()

let g:deoplete#enable_at_startup = 1

" deoplete tab to cycle
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

filetype plugin indent on

syntax enable
syntax on
colorscheme solarized

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound

let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:deoplete#enable_at_startup = 1 "NVIM ONLY

let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

set number
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set statusline+=%F
set laststatus=2
set background=dark
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
set textwidth=80
set colorcolumn=+1
set viminfo^=%
set modelines=0
set ttyfast
set scrolloff=5
set ignorecase
set smartcase
set showmatch

set rtp+=~/.fzf

let g:NERDTreeDirArrows=0

let mapleader = "\<Space>"
let paredit_leader = ","

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

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

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Return to last edit position when opening files
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif

inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

"remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

let javascript_enable_domhtmlcss = 1

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
