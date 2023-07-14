-- collumn numbers
vim.opt.relativenumber = true

-- ignore case search vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- auto cd to directory editing file in
vim.opt.autochdir = true

-- remove backups
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.undofile = false
vim.opt.swapfile  = false

-- horizontal autocomplete menu
vim.opt.wildoptions = 'tagfile'

-- use git grep 
vim.opt.gp = 'git grep -n'

-- netrw
vim.g.netrw_banner = 0

-- plug
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'fcpg/vim-fahrenheit'
	use 'jesseleite/vim-noh'
	use { 'nvim-treesitter/nvim-treesitter', run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end}
	use 'tpope/vim-commentary'
	use { 'junegunn/fzf', run = ":call fzf#install()" }
	use 'junegunn/fzf.vim'
end)

-- fzf
vim.g.fzf_layout = { window = { width = 1, height = 1 } }
vim.keymap.set('n', '<c-f>', '<cmd>GFiles<cr>')
vim.keymap.set('n', '<c-b>', '<cmd>Buffers<cr>')

-- treesitter
local ts_status_ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
print(ts_status_ok)
if ts_status_ok then
  ts_configs.setup {
    ensure_installed = 'all',
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    }
  }
end

-- colorscheme
-- vim.cmd('syntax on')
vim.cmd('colorscheme fahrenheit')
