
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

" syntax, indent, filetype
syntax on
filetype plugin indent on

" install vim-plug if it's not already
augroup PLUGGED
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
augroup end

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
set noshowmode

"   statusline         current vim mode   abs file path   current line       current column    all lines                     file encoding                          flags
"    ___||___                 _||_               \\          \\                    \\             \\              _______________||__________________              ___||_____
"   |        |               |    |              ||          ||                    ||             ||             |                                   |            |          |
set statusline=%#Function#[%{mode()}]\ %#Keyword#%F:%#Number#%l%#Keyword#:%#Number#%c%#Keyword#:\ %L\ %#String#%{&fileencoding?&fileencoding:&encoding}%#Normal#\ %m%r%h%w%y%q

" use system clipboard with just space
nnoremap <space> "+
vnoremap <space> "+

" python path
let g:python3_host_prog='/usr/bin/python3'

" change leader key
let mapleader=","

" mark trailing spaces as errors
match Error '\s\+$'


" custom autochdir (default not working when switching directories in netrw
" and also when i type :e /home/user - it sets current directory to /home,
" when i want it to be /home/user (like in dired mode in emacs))
" sollution from here:
" https://vi.stackexchange.com/questions/34557/how-can-i-use-let-gnetrw-keepdir-0-for-folders-and-autochdir-for-files
" https://gist.github.com/user202729/483421a9e88af58def12f2e085dc1c02
set noautochdir  " otherwise it conflict with netrw. Implement manually
let g:netrw_keepdir=0  " i.e. pwd = current browsing directory
function NetrwCheckAcd()
	" could also be "terminal" or something in which case do nothing
	if &buftype==""
		if isdirectory(expand("%"))
			call chdir(expand("%"))  " this is still necessary even with g:netrw_keepdir when triggered through remote vim...? TODO
		else
			if isdirectory(expand("%:h"))
				call chdir(expand("%:h"))  " simulate acd. Do this even in case % does not exist
			endif
		endif
	endif
endfunction
autocmd BufEnter * call NetrwCheckAcd()


" rg instead of standart grep (standart grep can be accessed with vimgrep)
" (don't use silversearcher-ag, it can's find
" text sometimes for example: i search with -i flag for a only caps russian
" text. result: not finded, but git grep and ripgrep easy find it, so use git grep)
set grepprg=rg\ --vimgrep


" netrw no banner
let g:netrw_banner=0

" colorscheme
colorscheme spaceway

" vimspector
" install gadgets from g:vimspector_install_gadgets by runing :VimspectorInstall GADGETNAME
" if it's failed to install gadget cuz of cachesum - change cachesum inside of
" plugin file ~/.local/share/nvim/plugged/vimspector/python3/vimspectorv/gadgets.py
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
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

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
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
  end, opts)
  end,
})
EOF
