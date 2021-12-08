" 16 colors
set notermguicolors t_Co=16

" status line
set statusline=%=%l:%c\ 

" always utf-8
set fileencoding=utf-8
set encoding=utf-8

" auto change directory
set autochdir

" syntax highlight
syntax enable

" normal copy paste
set clipboard=unnamedplus

" normalize tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
colorscheme delek
hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLine ctermfg=White ctermbg=NONE cterm=NONE
hi TabLineSel ctermfg=Blue ctermbg=NONE cterm=NONE
hi StatusLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatusLineNC ctermfg=Yellow ctermbg=NONE cterm=NONE
hi LineNr ctermfg=Yellow ctermbg=None cterm=None
hi SignColumn ctermfg=White ctermbg=None cterm=None
hi VertSplit ctermfg=Yellow ctermbg=None cterm=None
hi Pmenu ctermfg=None ctermbg=Black cterm=None
hi LspDiagnosticsDefaultError ctermfg=Red
hi LspDiagnosticsVirtualTextError ctermfg=Red

" remove comment section for Explore
let g:netrw_banner=0

" remove --INSERT--
set noshowmode

" sign column on start
set scl=yes

" disable comment new line when press enter from commented line
autocmd FileType * setlocal formatoptions-=cro
