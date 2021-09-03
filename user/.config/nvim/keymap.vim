" leader
let g:mapleader = ","

" comfort
nnoremap <Backspace> <Delete>
vnoremap <Backspace> <Delete>
nnoremap ; :

" disable highlight
nnoremap <silent> <Esc> :noh<CR><Esc>

" tabs and splits
nnoremap <leader>i :tabprevious<CR>
nnoremap <leader>o :tabnext<CR>
nnoremap <leader>v :split<CR>
nnoremap <leader>h :vsplit<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ignorecase
nnoremap <leader>c :set ignorecase<CR>
nnoremap <leader>C :set noignorecase<CR>

" split resize
nnoremap <silent> <leader>z :vertical resize -5<CR>
nnoremap <silent> <leader>x :vertical resize +5<CR>
nnoremap <silent> <leader>vz :resize -5<CR>
nnoremap <silent> <leader>vx :resize +5<CR>

" hjkl in insert modes
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
