local servers = { "pyright", "ccls"}

local nvim_lsp = require("lspconfig")
local cmp = require("cmp")

local on_attach = function(client, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap=true, silent=true }

    map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "J", ":lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    map("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    map("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    map("n", "<leader>t", ":lua vim.lsp.buf.type_definition()<CR>", opts)
    map("n", "<leader>r", ":lua vim.lsp.buf.rename()<CR>", opts)
    map("n", "<leader>y", ":lua vim.lsp.buf.code_action()<CR>", opts)
    map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
    map("n", "<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    map("n", "<leader>l", ":lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    map("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts)
end


cmp.setup({
    completion = {
        autocomplete = false,
    },
    mapping = {
        ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                cmp.complete()
            end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    })
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    }
end
