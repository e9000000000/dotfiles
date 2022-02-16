local packer_path = os.getenv("HOME").."/.local/share/nvim/site/pack/packer/start/packer.nvim"
if not exists(packer_path) then
    os.execute("git clone --depth 1 https://github.com/wbthomason/packer.nvim "..packer_path)
end

return require("packer").startup(function()
    -- packer itself
    use "wbthomason/packer.nvim"

    -- normal indents/syntax
    use "sheerun/vim-polyglot"

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

    -- theme
    use "morhetz/gruvbox"
end)
