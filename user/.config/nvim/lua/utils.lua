function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

function autocmd(events, filetype, command)
    vim.cmd("autocmd "..events.." "..filetype.." :lua "..command)
end

function get_indent()
    local indent = 4
    local filetype = vim.o.filetype
    if filetype == "haskell" then
        indent = 2
    elseif filetype == "yaml" then
        indent = 2
    elseif filetype == "nginx" then
        indent = 2
    end
    return indent
end

function get_expand_tab()
    local expand = true
    return expand
end
