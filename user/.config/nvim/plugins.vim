let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  autocmd VimEnter * call CocInstallExtentions()
  :UpdateRemotePlugins
endif

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

    " autocomplite () [] {}
    Plug 'jiangmiao/auto-pairs'

    " errors, go to definition, autocompliteon, etc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " tagbar
    Plug 'preservim/tagbar'

    " lightline
    Plug 'itchyny/lightline.vim'

    " comment/uncomment code
    Plug 'tpope/vim-commentary'

    " telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " debug
    Plug 'puremourning/vimspector'
call plug#end()
filetype plugin indent on

function CocInstallExtentions()
    :CocInstall coc-pyright
    :CocInstall coc-json
    :CocInstall coc-prettier
endfunction
