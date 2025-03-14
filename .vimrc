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
set hidden
set wildmenu
set wildmode=full:lastused
set makeprg=b
set termguicolors
set backspace=indent,eol,start
set grepprg=rg\ --vimgrep\ --smart-case
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
let g:netrw_banner=0
let zig_fmt_autosave=0

inoremap <tab> <esc>
xnoremap <tab> <esc>
nnoremap <C-c> "+yy
xnoremap <C-c> "+y
inoremap <C-v> <esc>"+pa
nnoremap <silent> <C-l> :noh<cr>
nnoremap <silent> <C-j> :let @+ = expand("%:p") . ":" . line(".")<cr>
nnoremap <silent> <C-b> :w<cr>:make<cr>

colorscheme desert

" git clone https://github.com/easymotion/vim-easymotion.git %home%\vimfiles\pack\plugins\start\vim-easymotion
let g:EasyMotion_smartcase = 1
nnoremap <space> <Plug>(easymotion-overwin-f)

" git clone https://github.com/github/copilot.vim.git %home%\vimfiles\pack\github\start\copilot.vim
imap <silent><script><expr> <C-j> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
