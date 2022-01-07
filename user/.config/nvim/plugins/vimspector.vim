let g:vimspector_install_gadgets = ['debugpy']
let g:vimspector_base_dir=expand('$HOME/.config/nvim/plugins/vimspector')

nmap <Leader>a <Plug>VimspectorContinue()
nmap <Leader>A <Plug>VimspectorRestart()
nmap <Leader>S <Plug>VimspectorPause
nmap <silent> <Leader>s :VimspectorReset<CR>
nmap <Leader>b <Plug>VimspectorToggleBreakpoint
nmap <Leader>g <Plug>VimspectorRunToCursor()
nmap <Leader>x <Plug>VimspectorStepOver()
nmap <Leader>Z <Plug>VimspectorStepOut()
nmap <Leader>z <Plug>VimspectorStepInto()
nmap <silent> <Leader>B :call vimspector#ClearBreakpoints()<CR>
