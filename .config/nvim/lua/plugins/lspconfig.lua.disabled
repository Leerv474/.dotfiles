return {
    -- LSP Support
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        -- set keybinds
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "list references", silent = true })

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration", silent = true })

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition", silent = true })

        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "go to implementations", silent = true })

        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action", silent = true })

        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "smart rename", silent = true })

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to previous diagnostic", silent = true })

        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to next diagnostic", silent = true })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show information under the cursor", silent = true })

        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = {
                                    "vim",
                                },
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                })
            end,
            ["clangd"] = function()
                lspconfig["clangd"].setup({
                    capabilities = capabilities,
                    cmd = {
                        "clangd",
                        "--fallback-style=webkit",
                    },
                })
            end,
        })
    end,
}
