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
set wildoptions-=pum
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

highlight clear
set background=dark
if exists("syntax_on")
    syntax reset
endif

hi Normal cterm=none ctermfg=Gray ctermbg=none
hi Keyword cterm=none ctermfg=White ctermbg=none
hi Constant cterm=none ctermfg=Gray ctermbg=none
hi String cterm=none ctermfg=Green ctermbg=none
hi Comment cterm=none ctermfg=DarkGray ctermbg=none
hi Number cterm=none ctermfg=Red ctermbg=none
hi Error cterm=none ctermfg=White ctermbg=DarkRed
hi ErrorMsg cterm=none ctermfg=White ctermbg=Red
hi Search cterm=none ctermfg=Gray ctermbg=DarkGray
hi IncSearch cterm=reverse ctermfg=White ctermbg=Gray
hi DiffChange cterm=none ctermfg=Red ctermbg=White
hi DiffText cterm=bold ctermfg=Gray ctermbg=Red
hi SignColumn cterm=none ctermfg=Red ctermbg=DarkGray
hi SpellBad cterm=undercurl ctermfg=White ctermbg=DarkRed
hi SpellCap cterm=none ctermfg=White ctermbg=Red
hi SpellRare cterm=none ctermfg=Red ctermbg=none
hi WildMenu cterm=none ctermfg=Red ctermbg=none
hi Pmenu cterm=none ctermfg=White ctermbg=DarkGray
hi PmenuThumb cterm=none ctermfg=Black ctermbg=DarkGray
hi SpecialKey cterm=none ctermfg=Black ctermbg=White
hi MatchParen cterm=none ctermfg=Black ctermbg=DarkGray
hi CursorLine cterm=none ctermfg=none ctermbg=none
hi StatusLine cterm=none ctermfg=Gray ctermbg=none
hi StatusLineNC cterm=reverse ctermfg=DarkGray ctermbg=none
hi Visual cterm=reverse ctermfg=Gray ctermbg=none
hi TermCursor cterm=reverse ctermfg=none ctermbg=none
hi Conditional cterm=none ctermfg=Blue ctermbg=none
hi Statement cterm=none ctermfg=Blue ctermbg=none

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
