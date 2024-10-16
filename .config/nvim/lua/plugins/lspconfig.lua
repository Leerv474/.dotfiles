---@diagnostic disable: missing-fields, undefined-global
return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },

        config = function()
            local mason = require("mason")
            local mason_config = require("mason-lspconfig")
            local mason_installer = require("mason-tool-installer")

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "󰄳",
                        package_pending = "",
                        package_uninstalled = "",
                    }, },
            })

            mason_config.setup({
                ensure_installed = {
                    "cmake",
                    "clangd",
                    "pyright",
                    "lua_ls",
                    "jdtls",
                    "cssls",
                    "lemminx",
                    "jsonls",
                    "bashls",
                    "marksman",
                    "ts_ls",
                    "sqls",
                },
            })

            mason_installer.setup({
                ensure_installer = {
                    "prettier",
                    "stylua",
                    "isort",
                    "black",
                    "clang-format",
                    "beautysh",
                    -- linters
                    "cpplint",
                    "eslint_d",
                    "checkstyle",
                    "pylint",
                    "luacheck",
                },
            })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",

        config = function()
            local mason_dap = require("mason-nvim-dap")
            mason_dap.setup({
                ensure_installed = {
                    "java-debug-adapter",
                    "java-test",
                },
            })
        end
    },
    {
        "mfussenegger/nvim-jdtls",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mfussenegger/nvim-dap",
        }
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.cmake.setup({
                capabilities = capabilities
            })
            lspconfig.clangd.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities
            })
            lspconfig.lemminx.setup({
                capabilities = capabilities
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities
            })
            lspconfig.bashls.setup({
                capabilities = capabilities
            })
            lspconfig.marksman.setup({
                capabilities = capabilities
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.sqls.setup({
                capabilities = capabilities
            })


            vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", {desc = "List references"})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {desc = "Go to declaration"})
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {desc = "List definitions"})
            vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", {desc = "List implementations"})
            vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", {desc = "List type definitions"})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {desc = "Code actions"})
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {desc = "Smart rename"})
            vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", {desc = "Show diagnostics for file"})
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {desc = "Show diagnostics for line"})
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc = "Jump prev diagnostic"})
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {desc = "Jump next diagnostic"})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Documentation under cursor"})

        end,
    },
}

