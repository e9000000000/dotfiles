-- syntax highlighting
vim.cmd "syntax enable"

-- netrw
vim.g.netrw_banner = 0

-- lazy readraw
vim.o.lazyredraw = true

-- split below
vim.o.splitbelow = true

-- disable text on start
vim.o.shortmess = "I"

-- always utf-8
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"

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
