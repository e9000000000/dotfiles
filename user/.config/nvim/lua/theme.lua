local hi = vim.highlight.create

vim.cmd "syntax enable"
vim.o.background = "dark"
vim.cmd "colorscheme delek"

hi("TabLineFill", {ctermfg="None", ctermbg="None", cterm="None"}, false)
hi("TabLine", {ctermfg="Grey", ctermbg="None", cterm="None"}, false)
hi("TabLineSel", {ctermfg="White", ctermbg="None", cterm="None"}, false)
hi("StatusLine", {ctermfg="None", ctermbg="None", cterm="None"}, false)
hi("StatusLineNC", {ctermfg="Yellow", ctermbg="None", cterm="None"}, false)
hi("LineNr", {ctermfg="Yellow", ctermbg="None", cterm="None"}, false)
hi("SignColumn", {ctermfg="White", ctermbg="None", cterm="None"}, false)
hi("VertSplit", {ctermfg="Yellow", ctermbg="None", cterm="None"}, false)
hi("Pmenu", {ctermfg="None", ctermbg="Black", cterm="None"}, false)
hi("Error", {ctermfg="Black", ctermbg="Red"}, false)
hi("NvimInternalError", {ctermfg="Black", ctermbg="Red"}, false)
hi("Special", {ctermfg="Magenta", ctermbg="None"}, false)
hi("MatchParen", {ctermfg="Black", ctermbg="Yellow"}, false)
hi("NonText", {ctermfg="Black", ctermbg="None", cterm="None"}, false)
hi("Todo", {ctermfg="Black", ctermbg="Red", cterm="None"}, false)
hi("Conceal", {ctermfg="Black", ctermbg="Grey", cterm="None"}, false)
hi("DiffAdd", {ctermfg="Black", ctermbg="Green", cterm="None"}, false)
hi("DiffChange", {ctermfg="Black", ctermbg="Blue", cterm="None"}, false)
hi("DiffDelete", {ctermfg="Black", ctermbg="Red", cterm="None"}, false)
hi("DiffText", {ctermfg="Black", ctermbg="Green", cterm="None"}, false)
hi("DiffLine", {ctermfg="Yellow", ctermbg="Black", cterm="None"}, false)
hi("Folded", {ctermfg="Yellow", ctermbg="Black", cterm="None"}, false)
hi("FoldColumn", {ctermfg="Yellow", ctermbg="Black", cterm="None"}, false)
hi("PmenuThumb", {ctermfg="Yellow", ctermbg="Black", cterm="None"}, false)
