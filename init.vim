" config
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set nonumber
set ignorecase
set smartcase
set incsearch
set autochdir
set cinoptions=l1
set nowritebackup
set nobackup
set noundofile
set noswapfile 
set wildmenu 
set gp=git\ grep\ -n

" netrw
let g:netrw_banner=0

" plug
call plug#begin()
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
call plug#end()

" keymap
let mapleader = " "
map <Leader> <Plug>(easymotion-prefix)

" easy motions
let g:EasyMotion_smartcase = 1















" color theme (base on https://github.com/andreasvc/vim-256noir)
highlight clear
set background=dark
if exists("syntax_on")
    syntax reset
endif

hi Normal cterm=NONE ctermfg=Gray ctermbg=None
hi Keyword cterm=NONE ctermfg=White ctermbg=None
hi Constant cterm=NONE ctermfg=Gray ctermbg=None
hi String cterm=NONE ctermfg=Gray ctermbg=None
hi Comment cterm=NONE ctermfg=DarkGray ctermbg=None
hi Number cterm=NONE ctermfg=Red ctermbg=None
hi Error cterm=NONE ctermfg=White ctermbg=DarkRed
hi ErrorMsg cterm=NONE ctermfg=White ctermbg=Red
hi Search cterm=NONE ctermfg=Gray ctermbg=DarkGray
hi IncSearch cterm=reverse ctermfg=White ctermbg=Gray
hi DiffChange cterm=NONE ctermfg=Red ctermbg=White
hi DiffText cterm=bold ctermfg=Gray ctermbg=Red
hi SignColumn cterm=NONE ctermfg=Red ctermbg=DarkGray
hi SpellBad cterm=undercurl ctermfg=White ctermbg=DarkRed
hi SpellCap cterm=NONE ctermfg=White ctermbg=Red
hi SpellRare cterm=NONE ctermfg=Red ctermbg=None
hi WildMenu cterm=NONE ctermfg=DarkGray ctermbg=White
hi Pmenu cterm=NONE ctermfg=White ctermbg=DarkGray
hi PmenuThumb cterm=NONE ctermfg=Black ctermbg=DarkGray
hi SpecialKey cterm=NONE ctermfg=Black ctermbg=White
hi MatchParen cterm=NONE ctermfg=Black ctermbg=DarkGray
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=None
hi StatusLine cterm=bold ctermfg=Gray ctermbg=None
hi StatusLineNC cterm=reverse ctermfg=DarkGray ctermbg=None
hi Visual cterm=reverse ctermfg=Gray ctermbg=None
hi TermCursor cterm=reverse ctermfg=NONE ctermbg=NONE

highlight! link Boolean Normal
highlight! link Delimiter Normal
highlight! link Identifier Normal
highlight! link Title Normal
highlight! link Debug Normal
highlight! link Exception Normal
highlight! link FoldColumn Normal
highlight! link Macro Normal
highlight! link ModeMsg Normal
highlight! link MoreMsg Normal
highlight! link Question Normal
highlight! link Conditional Keyword
highlight! link Statement Keyword
highlight! link Operator Keyword
highlight! link Structure Keyword
highlight! link Function Keyword
highlight! link Include Keyword
highlight! link Type Keyword
highlight! link Typedef Keyword
highlight! link Todo Keyword
highlight! link Label Keyword
highlight! link Define Keyword
highlight! link DiffAdd Keyword
highlight! link diffAdded Keyword
highlight! link diffCommon Keyword
highlight! link Directory Keyword
highlight! link PreCondit Keyword
highlight! link PreProc Keyword
highlight! link Repeat Keyword
highlight! link Special Keyword
highlight! link SpecialChar Keyword
highlight! link StorageClass Keyword
highlight! link SpecialComment String
highlight! link CursorLineNr String
highlight! link Character Number
highlight! link Float Number
highlight! link Tag Number
highlight! link Folded Number
highlight! link WarningMsg Number
highlight! link iCursor SpecialKey
highlight! link SpellLocal SpellCap
highlight! link LineNr Comment
highlight! link NonText Comment
highlight! link DiffDelete Comment
highlight! link diffRemoved Comment
highlight! link PmenuSbar Visual
highlight! link PmenuSel Visual
highlight! link VisualNOS Visual
highlight! link VertSplit Visual
highlight! link Cursor StatusLine
highlight! link Underlined SpellRare
highlight! link rstEmphasis SpellRare
highlight! link diffChanged DiffChange

hi link EasyMotionTarget Number
hi link EasyMotionTarget2First Number
hi link EasyMotionTarget2Second Number
hi link EasyMotionShade Comment
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search
