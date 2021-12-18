source $HOME/.config/nvim/keymap.vim
source $HOME/.config/nvim/vim-plug.vim
source $HOME/.config/nvim/settings.vim

if exists("g:vscode")
    source $HOME/.config/nvim/vscode/init.vim
else
    source $HOME/.config/nvim/plugins.vim
    source $HOME/.config/nvim/todo.vim
    source $HOME/.config/nvim/plugins/nerdtree.vim
    source $HOME/.config/nvim/plugins/gitgutter.vim
    source $HOME/.config/nvim/plugins/cmp.vim
    source $HOME/.config/nvim/plugins/lsp.vim
endif
