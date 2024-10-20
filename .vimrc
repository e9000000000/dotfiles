syntax on
filetype plugin indent on

call plug#begin()
Plug 'andreasvc/vim-256noir'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set tabstop=4
set shiftwidth=4
set autoindent
set noundofile
set noswapfile
set nobackup
set laststatus=0
set ttimeoutlen=0
set scrolloff=12
set incsearch
set ignorecase
set smartcase
set showcmd
set hlsearch
set lazyredraw
set ruler
colorscheme 256_noir

let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!**/.git/**'"
let g:fzf_vim = { 'preview_window': [] }
let g:fzf_layout = { 'down': '~66%' }

inoremap <tab> <esc>
xnoremap <tab> <esc>
nnoremap <C-c> "+yy
xnoremap <C-c> "+y
nnoremap <silent> <C-l> :noh<cr>
nnoremap <silent> <C-j> :let @+ = expand("%:p") . ":" . line(".")<cr>
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-f> :Rg<cr>
nnoremap <silent> <C-b> :Buffers<cr>
