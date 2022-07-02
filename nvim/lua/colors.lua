local hi = vim.highlight.create
vim.o.background = "dark"
vim.cmd "colorscheme peachpuff"


hi("TabLineFill", {ctermfg="None", ctermbg="None", cterm="None"}, false)
hi("TabLine", {ctermfg="Grey", ctermbg="None", cterm="None"}, false)
hi("TabLineSel", {ctermfg="White", ctermbg="None", cterm="None"}, false)
hi("StatusLine", {ctermfg="None", ctermbg="None", cterm="None"}, false)
hi("StatusLineNC", {ctermfg="Yellow", ctermbg="None", cterm="None"}, false)
hi("SignColumn", {ctermfg="White", ctermbg="None", cterm="None"}, false)
hi("VertSplit", {ctermfg="Yellow", ctermbg="None", cterm="None"}, false)
hi("Pmenu", {ctermfg="None", ctermbg="Black", cterm="None"}, false)
hi("PmenuThumb", {ctermfg="Yellow", ctermbg="Black", cterm="None"}, false)
hi("Todo", {ctermfg="Black", ctermbg="Red", cterm="None"}, false)
hi("Visual", {ctermbg="Black", cterm="inverse"}, false)
