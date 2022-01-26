-- autoreload files
vim.o.autoread = true

-- split below
vim.o.splitbelow = true

-- disable text on start
vim.o.shortmess = "I"

-- status line
vim.o.statusline = "%=%l:%c "

-- always utf-8
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"

-- auto change directory
vim.o.autochdir = false

-- normal copy paste
vim.o.clipboard = "unnamedplus"

-- normalize indents
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = false
vim.o.expandtab = true
vim.o.smartindent = false

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

-- set python3 provider
vim.g.python3_host_prog = "/bin/python"
