call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()

set tabstop=4
set shiftwidth=4
set autoindent
set noundofile
set noswapfile
set nobackup
set shortmess+=I
set laststatus=0
set ttimeoutlen=0
set scrolloff=12
set incsearch
set ignorecase
set smartcase
set wildmenu
set showcmd
set hlsearch
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

nnoremap <space> "+
xnoremap <space> "+
nnoremap <silent> <esc> :noh<cr><esc>
nnoremap <C-j> :let @+ = expand("%:p") . ":" . line(".")<cr>

let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!**/.git/**'"
let g:fzf_vim = { 'preview_window': [] }
let g:fzf_layout = { 'down': '~66%' }
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-f> :Rg<cr>

set background=dark
colorscheme lunaperche
highlight Error ctermbg=none
highlight Normal ctermbg=none
highlight EndOfBuffer ctermbg=none
