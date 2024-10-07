syntax on
filetype plugin indent on
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
set termguicolors

inoremap <tab> <esc>
xnoremap <tab> <esc>
nnoremap <space> "+
xnoremap <space> "+
nnoremap <silent> <C-l> :noh<cr>
nnoremap <silent> <C-j> :let @+ = expand("%:p") . ":" . line(".")<cr>
