execute pathogen#infect()
syntax enable
syntax on
colorscheme solarized

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set statusline+=%F
set laststatus=2
set background=dark
set ruler
set number
set numberwidth=4
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
set list listchars=tab:»·,trail:·,nbsp:·
set viminfo^=%

let g:user_emmet_leader_key='<C-E>'

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

filetype plugin indent on

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

command NT NERDTree

"remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

let javascript_enable_domhtmlcss = 1

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

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
