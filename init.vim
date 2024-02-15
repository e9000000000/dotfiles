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
    Plug 'Gavinok/SpaceWay.vim'
    Plug 'tpope/vim-rsi'
    Plug 'Aasim-A/scrollEOF.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdtree'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

" settings
set noundofile
set noswapfile
set nobackup
set ignorecase
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
set scrolloff=15
set grepprg=rg\ --smart-case\ --vimgrep
set list
set mouse=

" :noh
nnoremap <silent> <esc> :noh<cr><esc>

" don't wanna broke my fingers
nnoremap <space>w <C-w>

" use system clipboard with just space
nnoremap <space>y "+y
xnoremap <space>y "+y
nnoremap <space>p "+p
xnoremap <space>p "+p
nnoremap <space>Y "+Y
xnoremap <space>Y "+Y
nnoremap <space>P "+P
xnoremap <space>P "+P

" quickfix list hotkeys
nnoremap <space>n :cn<cr>
nnoremap <space>N :cp<cr>

" colorscheme
colorscheme spaceway

" lsp underlines disable my ability to read code
hi DiagnosticUnderlineError cterm=none
hi DiagnosticUnderlineWarn cterm=none
hi DiagnosticUnderlineInfo cterm=none
hi DiagnosticUnderlineHint cterm=none
hi DiagnosticUnderlineOk cterm=none


" telescope
nnoremap <space>k :Telescope resume<cr>
nnoremap <space>j :Telescope git_files show_untracked=1<cr>
nnoremap <space>J :Telescope find_files hidden=1 no_ignore=1<cr>
nnoremap <space>f :lua require'telescope.builtin'.live_grep( { cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] } )<cr>
nnoremap <space>F :Telescope live_grep<cr>
nnoremap <space>B :Telescope oldfiles<cr>
nnoremap <space>b :Telescope buffers sort_mru=1 ignore_current_buffer=1<cr>
nnoremap <space>h :Telescope help_tags<cr>

" NERDTree
let NERDTreeMinimalUI=1
let NERDTreeMapHelp='<C-h>'
nnoremap <space>a :NERDTreeFocus<cr>
nnoremap <space>m :NERDTree<cr>
nnoremap <space>t :NERDTreeToggle<cr>
nnoremap <space>g :NERDTreeFind<cr>


lua << EOF
require('scrollEOF').setup()


-- Setup language servers.
local lspconfig = require('lspconfig')

-- to make pyright work with venv - create a pyrightconfig.json file in the root of python project with following content:
-- {"venvPath": "/absolute/path/to/directory/which/contains/venv", "venv": "venv directory name (I am using .env)"}
-- then restart lsp :LspRestart<cr>
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys -- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>D', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>Wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>Wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>Wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>o', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF
