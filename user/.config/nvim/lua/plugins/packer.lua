local packer_path = os.getenv("HOME").."/.local/share/nvim/site/pack/packer/start/packer.nvim"
if not exists(packer_path) then
    os.execute("git clone --depth 1 https://github.com/wbthomason/packer.nvim "..packer_path)
end

return require("packer").startup(function()
    -- packer itself
    use "wbthomason/packer.nvim"

    -- todo, fixme, ... list
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {}
        end
    }

    -- comment/uncomment code
    use "tpope/vim-commentary"

    -- autopairs
    use "windwp/nvim-autopairs"

    -- fuzzy search
    use "junegunn/fzf.vim"

    -- lsp
    use "neovim/nvim-lspconfig"

    -- cmp
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    -- debuger
    use {"puremourning/vimspector", run = ":VimspectorUpdate"}

    -- normal indents
    use "Vimjas/vim-python-pep8-indent" -- python
    use "itchyny/vim-haskell-indent" -- haskell

    -- theme
    use "morhetz/gruvbox"
end)
