set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'rking/ag.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
"Plugin 'Raimondi/delimitMate'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on

syntax enable
syntax on
colorscheme solarized

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound

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

set rtp+=~/.fzf
map <silent> <C-p> :FZF<CR>

" hard mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let g:NERDTreeDirArrows=0

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

command NT NERDTree

"remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

let javascript_enable_domhtmlcss = 1

let g:lightline = {
  \ 'colorscheme': 'solarized'
  \ }

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
