" config
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set nonumber
set ignorecase
set smartcase
set incsearch
set autochdir
set cinoptions=l1
set nowritebackup
set nobackup
set noundofile
set noswapfile 
set wildoptions-=pum
set gp=git\ grep\ -n

" netrw
let g:netrw_banner=0

" plug
call plug#begin()
    Plug 'sickill/vim-monokai'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

" easy motions
let mapleader = " "
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1

" fzf
let g:fzf_layout = {'window': {'width': 1, 'height': 1}}
nmap <c-f> :GFiles<cr>
nmap <c-b> :Buffers<cr>

" colorscheme
colorscheme monokai
