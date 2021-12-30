" leader
let g:mapleader = ","

" comfort
nnoremap <Backspace> <Delete>
vnoremap <Backspace> <Delete>
nnoremap ; :
noremap <leader>q <C-^>

" disable highlight
nnoremap <silent> <Esc> :noh<CR><Esc>

" tabs and splits
noremap <silent> <C-i> :tabprevious<CR>
noremap <silent> <C-o> :tabnext<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ignorecase
nnoremap <leader>c :set ignorecase<CR>
nnoremap <leader>C :set noignorecase<CR>
