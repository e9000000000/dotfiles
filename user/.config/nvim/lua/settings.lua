-- autoreload files
vim.o.autoread = true

-- disable text on start
vim.o.shortmess = "I"

-- status line
vim.o.statusline = "%=%l:%c "

-- complite menu
vim.o.completeopt = "menu,menuone,noselect"

-- always utf-8
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"

-- auto change directory
vim.o.autochdir = false

-- normal copy paste
vim.o.clipboard = "unnamedplus"

-- normalize tab
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.smartindent = true

-- lines before end while scrolling
vim.o.scrolloff = 13

-- my backspace in insert mode not works with out this
vim.o.backspace = "indent,eol,start"

-- disable swapfiles
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- search highlighting
vim.o.incsearch = true
vim.o.hls = true

-- path
vim.o.path = ",,**"

-- ignore folders for :find
vim.o.wildignore = "**/__pycache__/**,**/.env/**,**/env/**,**/.git/**"

-- remove --INSERT--
vim.o.showmode = false

-- sign column on start
vim.o.scl = "yes"

-- disable comment new line when press enter from commented line
vim.cmd "autocmd FileType * setlocal formatoptions-=cro"

-- set python3 provider
vim.g.python3_host_prog = "/bin/python"
