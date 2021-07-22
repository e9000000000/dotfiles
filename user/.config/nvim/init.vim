" hardmode
nnoremap <Left> :echo "Unable"<CR>
nnoremap <Right> :echo "Unable"<CR>
nnoremap <Up> :echo "Unable"<CR>
nnoremap <Down> :echo "Unable"<CR>
nnoremap <PageUp> :echo "Unable"<CR>
nnoremap <PageDown> :echo "Unable"<CR>

" gui
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=R
    set guioptions-=l
endif

" line numbers
set relativenumber

" syntax highlight
syntax on

" better copy paste
set clipboard+=unnamedplus

" normalize tab
function SetTabIndent()
    if &filetype ==# 'haskell'
        set tabstop=2
        set softtabstop=2
        set shiftwidth=2
    else
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
    endif
endfunction
autocmd BufReadPost * call SetTabIndent()

set shiftround
set expandtab
set smartindent

" my backspace not works with out this
set backspace=indent,eol,start

" disable swapfile
set noswapfile
set nobackup
set nowritebackup

" search highlighting
set incsearch
set hls

" path
set path=.,**

" colorscheme
set background=dark
:colorscheme delek
highlight LineNr ctermfg=Yellow ctermbg=Black cterm=None
highlight SignColumn ctermfg=White ctermbg=Black cterm=None
highlight VertSplit ctermfg=Yellow ctermbg=Black cterm=None
highlight StatusLine ctermfg=Black ctermbg=Yellow cterm=None
highlight StatusLineNC ctermfg=Black ctermbg=Yellow cterm=None

" remove comment section for Explore
let g:netrw_banner=0

" sign column
set scl=yes

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
call plug#end()
filetype plugin indent on

" status line
set statusline=%f%=\ %l/%L\ %c

" hotkeys
let g:mapleader = ","
nnoremap <leader>i :tabprevious<CR>
nnoremap <leader>o :tabnext<CR>
nnoremap <leader>d :NERDTree<CR>
nnoremap <leader>f :TagbarToggle<CR><C-W>l
nnoremap <leader>e :ALEDetail<CR>

" nerdtree
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1

" nerdtree git
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'M',
    \ 'Staged'    :'+',
    \ 'Untracked' :'U',
    \ 'Renamed'   :'R',
    \ 'Unmerged'  :'N',
    \ 'Deleted'   :'X',
    \ 'Dirty'     :'D',
    \ 'Ignored'   :'i',
    \ 'Clean'     :'C',
    \ 'Unknown'   :'?',
\ }
let g:NERDTreeGitStatusShowIgnored = 1

" gitgutter
highlight GitGutterAdd ctermfg=Green
highlight GitGutterChange ctermfg=Grey
highlight GitGutterDelete ctermfg=Red

" ale
let g:ale_linters = {
\   'python': ['flake8'],
\   'haskell': ['ghc']
\}
let g:ale_fixers = {
\    'python': ['black'],
\    'haskell': ['ormolu']
\}
let g:ale_fix_on_save = 1

" tagbar
let g:tagbar_compact = 1
let g:tagbar_type_haskell = {
    \ 'ctagsbin'    : 'hasktags',
    \ 'ctagsargs'   : '-x -c -o-',
    \ 'kinds'       : [
        \  'm:modules:0:1',
        \  'd:data:0:1',
        \  'd_gadt:data gadt:0:1',
        \  'nt:newtype:0:1',
        \  'c:classes:0:1',
        \  'i:instances:0:1',
        \  'cons:constructors:0:1',
        \  'c_gadt:constructor gadt:0:1',
        \  'c_a:constructor accessors:1:1',
        \  't:type names:0:1',
        \  'pt:pattern types:0:1',
        \  'pi:pattern implementations:0:1',
        \  'ft:function types:0:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'          : '.',
    \ 'kind2scope'   : {
        \ 'm'        : 'module',
        \ 'd'        : 'data',
        \ 'd_gadt'   : 'd_gadt',
        \ 'c_gadt'   : 'c_gadt',
        \ 'nt'       : 'newtype',
        \ 'cons'     : 'cons',
        \ 'c_a'      : 'accessor',
        \ 'c'        : 'class',
        \ 'i'        : 'instance'
    \ },
    \ 'scope2kind'   : {
        \ 'module'   : 'm',
        \ 'data'     : 'd',
        \ 'newtype'  : 'nt',
        \ 'cons'     : 'c_a',
        \ 'd_gadt'   : 'c_gadt',
        \ 'class'    : 'ft',
        \ 'instance' : 'ft'
    \ }
\ }
