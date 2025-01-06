syntax on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set autoindent
set noundofile
set noswapfile
set nobackup
set laststatus=0
set scrolloff=12
set incsearch
set ignorecase
set smartcase
set showcmd
set hlsearch
set lazyredraw
set ruler

inoremap <tab> <esc>
xnoremap <tab> <esc>
nnoremap <C-c> "+yy
xnoremap <C-c> "+y
nnoremap <silent> <C-l> :noh<cr>
nnoremap <silent> <C-j> :let @+ = expand("%:p") . ":" . line(".")<cr>

autocmd BufNewFile,BufRead *.script :set filetype=lua
autocmd BufNewFile,BufRead *.fp :set filetype=glsl
autocmd BufNewFile,BufRead *.vp :set filetype=glsl
