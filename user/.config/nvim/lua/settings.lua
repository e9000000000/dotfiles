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
function set_indents()
    vim.o.tabstop = get_indent()
    vim.o.softtabstop = get_indent()
    vim.o.shiftwidth = get_indent()
    vim.o.expandtab = get_expand_tab()
end
set_indents()
autocmd("FileType", "*", "set_indents()")
vim.o.shiftround = false

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
vim.o.showmode = true

-- sign column on start
vim.o.scl = "yes"

-- set python3 provider
vim.g.python3_host_prog = "/bin/python"
