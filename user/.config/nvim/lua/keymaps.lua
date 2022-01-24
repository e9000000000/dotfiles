local map = vim.api.nvim_set_keymap

-- maps for lsp and cmp located in plugins/lsp.lua

-- leader
vim.g.mapleader = ","

-- find
map("", "<Leader>f", ":find ", {noremap=true, silent=false})

-- term
map("", "<Leader>v", ":split<CR> :term<CR>i", {noremap=true, silent=false})

-- comfort
map("", "<Backspace>", "<Delete>", {noremap=true, silent=true})
map("", ";", ":", {noremap=true, silent=false})
map("", "<leader>q", "<C-^>", {noremap=true, silent=true})

-- disable highlight
map("n", "<Esc>", ":noh<CR><Esc>", {noremap=true, silent=true})

-- tabs and splits
map("", "<C-i>", ":tabprevious<CR>", {noremap=true, silent=true})
map("", "<C-o>", ":tabnext<CR>", {noremap=true, silent=true})
map("", "<C-h>", "<C-w>h", {noremap=true, silent=true})
map("", "<C-j>", "<C-w>j", {noremap=true, silent=true})
map("", "<C-k>", "<C-w>k", {noremap=true, silent=true})
map("", "<C-l>", "<C-w>l", {noremap=true, silent=true})

-- ignorecase
map("", "<leader>c", ":set ignorecase<CR>", {noremap=true, silent=false})
map("", "<leader>C", ":set noignorecase<CR>", {noremap=true, silent=false})

-- term
map("t", "<Esc>", "<C-\\><C-n>", {noremap=true, silent=true})

-- open nerdtree
map("", "<leader>d", ":e .<CR>", {noremap=true, silent=true})

-- vimspector
map("", "<leader>a", ":call vimspector#Continue()<CR>", {noremap=true, silent=true})
map("", "<leader>A", ":call vimspector#Restart()<CR>", {noremap=true, silent=true})
map("", "<leader>s", ":VimspectorReset<CR>", {noremap=true, silent=true})
map("", "<leader>S", ":call vimspector#Pause()<CR>", {noremap=true, silent=true})
map("", "<leader>b", ":call vimspector#ToggleBreakpoint()<CR>", {noremap=true, silent=true})
map("", "<leader>B", ":call vimspector#ClearBreakpoints()<CR>", {noremap=true, silent=true})
map("", "<leader>g", ":call vimspector#RunToCursor()<CR>", {noremap=true, silent=true})
map("", "<leader>x", ":call vimspector#StepOver()<CR>", {noremap=true, silent=true})
map("", "<leader>z", ":call vimspector#StepInto()<CR>", {noremap=true, silent=true})
map("", "<leader>Z", ":call vimspector#StepOut()<CR>", {noremap=true, silent=true})
