" leader
let g:mapleader = ","

" comfort
nnoremap <Backspace> <Delete>
vnoremap <Backspace> <Delete>
nnoremap ; :

" disable highlight
nnoremap <silent> <Esc> :noh<CR><Esc>

" tabs and splits
nnoremap <C-i> :tabprevious<CR>
nnoremap <C-o> :tabnext<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ignorecase
nnoremap <leader>c :set ignorecase<CR>
nnoremap <leader>C :set noignorecase<CR>

" hjkl in insert modes
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
