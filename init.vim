" vim-plug install command
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on
filetype plugin indent on

" plugins
call plug#begin()
    Plug 'pgdouyon/vim-yin-yang'
    Plug 'jesseleite/vim-noh'
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdtree'

    Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" settings
set noswapfile
set smartcase
set incsearch
set autochdir
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set encoding=UTF-8
set list
set timeoutlen=314
set grepprg=git\ grep\ -rniF

" use system clipboard with just space
nnoremap <space> "+
vnoremap <space> "+

" colorscheme
colorscheme yin

" NERDTree
let NERDTreeMinimalUI=1
let NERDTreeMapHelp='<C-h>'
nnoremap <space>a :NERDTreeFocus<CR>
nnoremap <space>n :NERDTree<CR>
nnoremap <space>t :NERDTreeToggle<CR>
nnoremap <space>f :NERDTreeFind<CR>
