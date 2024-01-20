" vim-plug install command
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

syntax on
filetype plugin indent on

" plugins
call plug#begin()
    Plug 'Gavinok/SpaceWay.vim'
    Plug 'jesseleite/vim-noh'
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdtree'
    Plug 'puremourning/vimspector'

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
colorscheme spaceway

" NERDTree
let NERDTreeMinimalUI=1
let NERDTreeMapHelp='<C-h>'
nnoremap <space>a :NERDTreeFocus<CR>
nnoremap <space>n :NERDTree<CR>
nnoremap <space>t :NERDTreeToggle<CR>
nnoremap <space>f :NERDTreeFind<CR>

" vimspector
let g:vimspector_install_gadgets = [ 'debugpy', 'CodeLLDB' ]
let g:vimspector_enable_mappings = 'HUMAN'
set <S-F1>=^[O1;0R
set <S-F3>=^[O1;2R
set <S-F4>=^[O1;3R
nnoremap <space>d <Plug>VimspectorBalloonEval
xnoremap <space>d <Plug>VimspectorBalloonEval
nnoremap <f1> <Plug>VimspectorStepInto
nnoremap <f2> <Plug>VimspectorStepOver
nnoremap <f3> <Plug>VimspectorStepOut
nnoremap <space>b <Plug>VimspectorToggleBreakpoint
nnoremap <space>c <Plug>VimspectorAddFunctionBreakpoint
nnoremap <f4> <Plug>VimspectorRestart
nnoremap <f7> :VimspectorReset<cr>
