
"  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
"  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
" ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
" ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
" ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
" ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
" ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░     ░░   ░ ░
"          ░    ░  ░    ░ ░        ░   ░         ░      ░     ░ ░
"                                 ░                           ░

" run this command install vim-plug
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" run :PlugInstall for plugins installation
"
" install vimspector gadgets from g:vimspector_install_gadgets by runing :VimspectorInstall GADGETNAME
" if it's failed to install gadget cuz of cachesum - change cachesum inside of
" plugin file ~/.local/share/nvim/plugged/vimspector/python3/vimspectorv/gadgets.py

syntax on
filetype plugin indent on
set ignorecase
set smartcase
set incsearch
set autochdir
set smartcase
set smartindent
set smarttab
set expandtab
set cindent
set tabstop=2
set shiftwidth=2
set encoding=UTF-8
set ttimeoutlen=50

" mark trailing spaces as errors
match Error '\s\+$'


" plugins
call plug#begin()
  Plug 'puremourning/vimspector'
  Plug 'caiocutrim/black-coffee-molokai'
call plug#end()

" colorscheme
colorscheme black-coffee-molokai
hi Normal ctermbg=none
hi NonText ctermbg=none
hi CursorLine ctermbg=none
hi Visual ctermbg=169
hi Search ctermbg=169


" vimspector
let g:vimspector_enable_mappings = 'HUMAN'  " https://github.com/puremourning/vimspector#human-mode
let g:vimspector_install_gadgets = [ 'debugpy' ]
