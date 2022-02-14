local map = vim.api.nvim_set_keymap

-- maps for lsp and autocompletion located in plugins/lsp.lua

-- leader
vim.g.mapleader = ","

-- comfort
map("", ";", ":", {noremap=true, silent=false})
map("", "<leader>q", "<C-^>", {noremap=true, silent=true})
map("c", "<C-f>", "<Right>", {noremap=true, silent=false})
map("c", "<C-b>", "<Left>", {noremap=true, silent=false})
map("i", "<C-f>", "<Right>", {noremap=true, silent=false})
map("i", "<C-b>", "<Left>", {noremap=true, silent=false})
map("t", "<Esc>", "<C-\\><C-n>", {noremap=true, silent=true})

-- fzf
map("n", "<C-g>", ":FzfFiles<CR>", {noremap=true, silent=true})
map("n", "<C-f>", ":FzfGFiles<CR>", {noremap=true, silent=true})
map("n", "<Leader>f", ":FzfAg<CR>", {noremap=true, silent=true})

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
