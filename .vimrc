"  ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
" ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"  ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"   ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"    ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"      ░░   ▒ ░░      ░     ░░   ░ ░
"       ░   ░         ░      ░     ░ ░
"      ░                           ░

" run this command install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on
filetype plugin indent on

" plugins
call plug#begin()
    Plug 'gavinok/spaceway.vim'
    Plug 'jesseleite/vim-noh'
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdtree'
call plug#end()


" settings
set noswapfile
set ignorecase
set smartcase
set incsearch
set autochdir
set noesckeys
set smartcase
set smartindent
set smarttab
set expandtab
set cindent
set tabstop=4
set shiftwidth=4
set encoding=UTF-8
set ttimeoutlen=50


" use system clipboard with just space
nnoremap <space> "+
vnoremap <space> "+


" mark trailing spaces as errors
match Error '\s\+$'


" rg instead of standart grep (standart grep can be accessed with vimgrep)
" don't use silversearcher-ag, it can's find
" text sometimes for example: i search with -i flag for a only caps russian
" text. result: not finded, but git grep and ripgrep easy find it,
" so use git grep
set grepprg=git\ grep\ -rniF


" colorscheme
colorscheme spaceway


" NERDTree
let NERDTreeMinimalUI=1
nnoremap <C-i> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
noremap <C-f> :NERDTreeFind<CR>
