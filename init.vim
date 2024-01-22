" vim-plug install command
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on
filetype plugin indent on

" plugins
call plug#begin()
    Plug 'tek256/simple-dark'
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdtree'
    Plug 'kien/ctrlp.vim'

    Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" settings
set noundofile
set noswapfile
set nobackup
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

" :noh
nnoremap <silent> <esc> :noh<cr><esc>

" use system clipboard with just space
nnoremap <space> "+
vnoremap <space> "+

" quickfix list hotkeys
nnoremap <space>n :cn<cr>
nnoremap <space>N :cp<cr>

" colorscheme
colorscheme simple-dark
hi StatusLine cterm=none ctermfg=253 ctermbg=none gui=bold guifg=#8a8a8a guibg=#000000
hi StatusLineNC cterm=none ctermfg=245 ctermbg=none gui=reverse guifg=#303030 guibg=#000000
hi TabLineSel cterm=none ctermfg=253 ctermbg=none gui=bold guifg=#8a8a8a guibg=#000000
hi TabLine cterm=none ctermfg=245 ctermbg=none gui=reverse guifg=#303030 guibg=#000000
hi TabLineFill cterm=none ctermfg=245 ctermbg=none gui=reverse guifg=#303030 guibg=#000000
hi WinSeparator cterm=none ctermfg=245 ctermbg=none gui=reverse guifg=#303030 guibg=#000000

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <C-b> :CtrlPBuffer<cr>

" NERDTree
let NERDTreeMinimalUI=1
