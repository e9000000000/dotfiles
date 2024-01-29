" vim-plug install command
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" install ripgrep for searching
" doas apt install ripgrep

syntax on
filetype plugin indent on

" plugins
call plug#begin()
    Plug 'pgdouyon/vim-yin-yang'
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdtree'
    Plug 'kien/ctrlp.vim'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

" settings
set noundofile
set noswapfile
set nobackup
set smartcase
set incsearch
set autochdir
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set encoding=UTF-8
set timeoutlen=314
set signcolumn=no
set scrolloff=12
set grepprg=rg\ --smart-case\ --vimgrep

" :noh
nnoremap <silent> <esc> :noh<cr><esc>

" ctrl + s for save
nnoremap <silent> <C-s> :w<cr>

" use system clipboard with just space
nnoremap <space> "+
vnoremap <space> "+

" quickfix list hotkeys
nnoremap <space>n :cn<cr>
nnoremap <space>N :cp<cr>

" colorscheme
colorscheme yin

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <C-b> :CtrlPBuffer<cr>

" NERDTree
let NERDTreeMinimalUI=1
let NERDTreeMapHelp='<C-h>'
nnoremap <space>a :NERDTreeFocus<cr>
nnoremap <space>m :NERDTree<cr>
nnoremap <space>t :NERDTreeToggle<cr>
nnoremap <space>f :NERDTreeFind<cr>


lua << EOF
-- Setup language servers.
local lspconfig = require('lspconfig')

-- to make pyright work with venv - create a pyrightconfig.json file in the root of python project with following content:
-- {"venvPath": "/absolute/path/to/directory/which/contains/venv", "venv": "venv directory name (I am using .env)"}
-- then restart lsp :LspRestart<cr>
lspconfig.pyright.setup {}

lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}


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
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF
