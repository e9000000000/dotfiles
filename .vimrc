filetype plugin on
syntax enable

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'gavinok/spaceway.vim'
call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set noundofile
set noswapfile
set nobackup
set shortmess+=I
set nonumber
set laststatus=0
set grepprg=rg\ --vimgrep\ --hidden
set ttimeoutlen=0
set scrolloff=12
set incsearch
set ignorecase
set smartcase

nnoremap <space> "+
xnoremap <space> "+
nnoremap <C-j> :let @+ = expand("%:p") . ":" . line(".")<cr>

let $FZF_DEFAULT_COMMAND = "rg --files --vimgrep"
nnoremap <C-p> :Files!<cr>
nnoremap <C-b> :Buffers!<cr>
nnoremap <C-f> :Rg!<cr>

colorscheme spaceway
