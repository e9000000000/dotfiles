call plug#begin('~/.vim/bundle')
    " nerdtree 
    Plug 'preservim/nerdtree'

    " git
    " nerdtree git integration
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " show changes in file from last commit
    Plug 'airblade/vim-gitgutter'
    " show git branch
    Plug 'itchyny/vim-gitbranch'

    " lightline
    " Plug 'itchyny/lightline.vim'

    " comment/uncomment code
    Plug 'tpope/vim-commentary'

    " lsp
    Plug 'neovim/nvim-lspconfig'
call plug#end()
