-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.undofile = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.laststatus = 0
vim.o.ttimeoutlen = 0
vim.o.scrolloff = 12
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showcmd = true
vim.o.hlsearch = true
vim.o.lazyredraw = true

vim.keymap.set({ 'x', 'i' }, '<tab>', '<esc>', { silent = true })
vim.keymap.set({ 'n', 'x' }, '<space>', '"+', { silent = true })
vim.keymap.set('n', '<C-c>', '<cmd>noh<cr>', { silent = true })
vim.keymap.set('n', '<C-j>', '<cmd>let @+ = expand("%:p") . ":" . line(".")<cr>', { silent = true })

local tb = require('telescope.builtin')
local tb_layout_config = {
	width = 12151150,
	height = 12151150,
}
vim.keymap.set('n', '<C-p>', function() tb.find_files({ layout_config=tb_layout_config }) end, {})
vim.keymap.set('n', '<C-f>', function() tb.live_grep({ layout_config=tb_layout_config }) end, {})
vim.keymap.set('n', '<C-b>', function() tb.oldfiles({ layout_config=tb_layout_config }) end, {})
vim.keymap.set('n', '<C-l>', tb.resume, {})
