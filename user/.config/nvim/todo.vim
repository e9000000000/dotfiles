" delete current buffer and shows all finded in folder and subfolders TODOs
" <leader>t to call this
" select todo u want teleport to and press enter for goint to edit it

function! s:todolist()
    if &modified
        echo "Current buffer unsaved"
        return
    endif

    bd
    setlocal nobuflisted buftype=nofile bufhidden=delete noswapfile
    nnoremap <silent><buffer> <CR> :TodoListJump<CR>

    let b:todos = []
    let files = system('find . -type f')
    for file in split(files, "\n")
        let b:lines = readfile(file)
        let linenum = 0
        for line in b:lines
            let linenum += 1
            let subline = matchstr(line, "TODO.*")
            if !empty(subline)
                let b:todos += [{"line": subline, "linenum": linenum, "file": file}]
            endif
        endfor
    endfor

    let b:todos = sort(b:todos, {a, b -> a.line < b.line})
    let max_filename_and_linenum_len = 0
    for todo in b:todos
        let max_filename_and_linenum_len = max([max_filename_and_linenum_len, len(todo.file) + len(todo.linenum)])
    endfor

    let linenum_in_todos = 0
    for todo in b:todos
        let linenum_in_todos += 1
        let spaces = repeat(" ", max_filename_and_linenum_len - len(todo.file) + len(todo.linenum) + 3)
        call setline(linenum_in_todos, todo.file . ":" . todo.linenum . spaces . todo.line)
    endfor

    :setlocal nomodifiable
    
endfunction


function! s:todolistjump()
    if len(b:todos) <= 0
        b#
        return
    endif

    let i = line(".") - 1
    execute "edit +" . b:todos[i].linenum b:todos[i].file
endfunction

command! TodoList call s:todolist()
command! TodoListJump call s:todolistjump()
nnoremap <silent> <leader>t :TodoList<CR>


" TODO: make it work
" run code from buffer (not file) in new tmux window? don't know, split verticaly and run code
" works for: python
function! s:run_current_buffer()
    let text = join(getline(1, 99999999999), "\n")
    echom system('tmux new-window python -c "' . text . '"')
endfunction

command! RunCurrentBuffer call s:run_current_buffer()
