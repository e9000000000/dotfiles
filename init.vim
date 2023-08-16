
"  ██▓ ███▄    █  ██▓▄▄▄█████▓      ██▒   █▓ ██▓ ███▄ ▄███▓
" ▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
" ▒██▒▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░      ▓██  █▒░▒██▒▓██    ▓██░
" ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░        ▒██ █░░░██░▒██    ▒██
" ░██░▒██░   ▓██░░██░  ▒██▒ ░  ██▓    ▒▀█░  ░██░▒██▒   ░██▒
" ░▓  ░ ▒░   ▒ ▒ ░▓    ▒ ░░    ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░
"  ▒ ░░ ░░   ░ ▒░ ▒ ░    ░     ░▒     ░ ░░   ▒ ░░  ░      ░
"  ▒ ░   ░   ░ ░  ▒ ░  ░       ░        ░░   ▒ ░░      ░
"  ░           ░  ░             ░        ░   ░         ░
"                               ░       ░


" run this command install vim-plug sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" run :PlugInstall for plugins installation
"
" install vimspector gadgets from g:vimspector_install_gadgets by runing :VimspectorInstall GADGETNAME
" if it's failed to install gadget cuz of cachesum - change cachesum inside of
" plugin file ~/.local/share/nvim/plugged/vimspector/python3/vimspectorv/gadgets.py

" syntax, indent, filetype
syntax on
filetype plugin indent on

" plugins
call plug#begin()
Plug 'gavinok/spaceway.vim'
Plug 'puremourning/vimspector'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'jesseleite/vim-noh'
Plug 'tpope/vim-commentary'
call plug#end()

" settings
set ignorecase
set smartcase
set incsearch
set autochdir
set smartcase
set smartindent
set smarttab
set expandtab
set cindent
set tabstop=2
set shiftwidth=2
set encoding=UTF-8
set ttimeoutlen=50
set wildoptions-=pum
set signcolumn=yes

" python path
let g:python3_host_prog='/usr/bin/python3'

" change leader key
let mapleader=","

" mark trailing spaces as errors
match Error '\s\+$'

" netrw no banner
let g:netrw_banner=0

" colorscheme
colorscheme spaceway

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'  " https://github.com/puremourning/vimspector#human-mode
let g:vimspector_install_gadgets = [ 'debugpy' ]
nnoremap <f7> :VimspectorReset<cr>

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <C-b> :CtrlPBuffer<cr>

" lua
:lua << EOF
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
  vim.lsp.buf.format { async = true }
  end, opts)
  end,
})
EOF
