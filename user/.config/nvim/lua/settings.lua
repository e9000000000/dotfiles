-- theme
vim.cmd "syntax enable"
vim.o.background = "dark"
vim.cmd "colorscheme gruvbox"

-- netrw
vim.g.netrw_banner = 0

-- split below
vim.o.splitbelow = true

-- disable text on start
vim.o.shortmess = "I"

-- always utf-8
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"

-- normal copy paste
vim.o.clipboard = "unnamedplus"

-- normalize indents
vim.cmd "filetype plugin indent on"
vim.o.smartindent = true

-- lines before end while scrolling
vim.o.scrolloff = 13

-- disable swapfiles
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- sign column on start
vim.o.scl = "yes"

-- set python3 provider
vim.g.python3_host_prog = "/bin/python"
