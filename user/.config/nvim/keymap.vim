" disable inefficient controls
nnoremap <Left> :echo "Unable"<CR>
nnoremap <Right> :echo "Unable"<CR>
nnoremap <Up> :echo "Unable"<CR>
nnoremap <Down> :echo "Unable"<CR>
nnoremap <PageUp> :echo "Unable"<CR>
nnoremap <PageDown> :echo "Unable"<CR>

" leader
let g:mapleader = ","

" comfort
nnoremap <Backspace> <Delete>
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

" tagbar adn nerdtree
nnoremap <leader>d :NERDTree<CR>
nnoremap <leader>t :TagbarToggle<CR><C-W>l

" coc
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>r <Plug>(coc-rename)

" ignorecase
nnoremap <leader>c :set ignorecase<CR>
nnoremap <leader>C :set noignorecase<CR>

" split resize
nnoremap <silent> <leader>z :vertical resize -5<CR>
nnoremap <silent> <leader>x :vertical resize +5<CR>
nnoremap <silent> <leader>vz :resize -5<CR>
nnoremap <silent> <leader>vx :resize +5<CR>

" telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
