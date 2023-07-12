" tab width
set tabstop=4
set shiftwidth=4
set expandtab

" no number collumn
set nonumber

" ignore case search
set ignorecase
set smartcase
set incsearch

" auto cd to directory editing file in
set autochdir

" remove backups
set nowritebackup
set nobackup
set noundofile
set noswapfile 

" horizontal autocomplete menu
set wildoptions-=pum

" use git grep 
set gp=git\ grep\ -n

" netrw
let g:netrw_banner=0

" plug
filetype plugin indent on
call plug#begin()
    Plug 'fcpg/vim-fahrenheit'
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
syntax on
colorscheme fahrenheit
