return {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
        "nvimtools/none-ls-extras.nvim"
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup()
        require("mason-null-ls").setup({
            ensure_installed = { "stylua", "goimports", "eslint_d", "prettier" },
            handlers = {
                stylua = function(source_name, methods)
                    require("none-ls.diagnostics.eslint_d")
                    null_ls.register(null_ls.builtins.formatting.stylua)
                    null_ls.register(null_ls.builtins.formatting.prettier)
                end
            }
        })
        vim.keymap.set("n","<leader>gf", vim.lsp.buf.format, {})
    end,
}
