let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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

    " lightline
    Plug 'itchyny/lightline.vim'

    " comment/uncomment code
    Plug 'tpope/vim-commentary'
call plug#end()
filetype plugin indent on
