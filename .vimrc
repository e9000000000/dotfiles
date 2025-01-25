syntax on
filetype plugin indent on

" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
"     ni $HOME/vimfiles/autoload/plug.vim -Force
call plug#begin()
Plug 'preservim/nerdtree'
call plug#end()

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
set hidden
set wildmenu
set wildmode=full:lastused
set termguicolors
let NERDTreeMinimalUI=1

inoremap <tab> <esc>
xnoremap <tab> <esc>
nnoremap <C-c> "+yy
xnoremap <C-c> "+y
nnoremap <silent> <C-l> :noh<cr>
nnoremap <silent> <C-j> :let @+ = expand("%:p") . ":" . line(".")<cr>
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-y> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

colorscheme desert
