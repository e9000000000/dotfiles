" lines numbers
set relativenumber

" syntax highlight
syntax on

" normal copy paste
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
autocmd FileType * call SetTabIndent()

set shiftround
set expandtab
set smartindent

" my backspace in insert mode not works with out this
set backspace=indent,eol,start

" disable swapfiles
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
highlight LineNr ctermfg=Yellow ctermbg=None cterm=None
highlight SignColumn ctermfg=White ctermbg=None cterm=None
highlight VertSplit ctermfg=Yellow ctermbg=None cterm=None
highlight Pmenu ctermfg=None ctermbg=Black cterm=None

" remove comment section for Explore
let g:netrw_banner=0

" remove --INSERT--
set noshowmode

" sign column on start
set scl=yes

" disable comment new line when press enter from commented line
autocmd FileType * setlocal formatoptions-=cro
