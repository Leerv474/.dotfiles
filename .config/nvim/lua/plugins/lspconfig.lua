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
        local opts = { noremap = true, silent = true }
        -- Basic diagnostic mappings, these will navigate to or display diagnostics
        vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts) -- set keybinds

        local on_attach = function(client, bufnr)
            -- Mappings to magical LSP functions!
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gk", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
        end

        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    on_attach = on_attach,
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
                    on_attach = on_attach,
                    capabilities = capabilities,
                    cmd = {
                        "clangd",
                        "--fallback-style=webkit",
                    },
                })
            end,
            ["ts_ls"] = function()
                lspconfig["ts_ls"].setup({
                    on_attach = function(client, bufnr)
                        client.server_capabilities.completionProvider = {
                            resolveProvider = false,
                        }
                        on_attach(client, bufnr)
                    end,
                    server = vim.tbl_extend("keep", {
                        root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json"),
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            client.server_capabilities.documentFormattingProvider = false
                            client.server_capabilities.documentRangeFormattingProvider = false
                        end,
                    }, {}),
                })
            end,
            ["emmet_language_server"] = function()
                lspconfig["emmet_language_server"].setup({
                    filetypes = {
                        "eruby",
                        "javascript",
                        "javascriptreact",
                        "less",
                        "sass",
                        "scss",
                        "pug",
                        "typescriptreact",
                    },
                    -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
                    -- **Note:** only the options listed in the table are supported.
                    init_options = {
                        ---@type table<string, string>
                        includeLanguages = {},
                        --- @type string[]
                        excludeLanguages = {},
                        --- @type string[]
                        extensionsPath = {},
                        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                        preferences = {},
                        --- @type boolean Defaults to `true`
                        showAbbreviationSuggestions = true,
                        --- @type "always" | "never" Defaults to `"always"`
                        showExpandedAbbreviation = "always",
                        --- @type boolean Defaults to `false`
                        showSuggestionsAsSnippets = true,
                        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                        syntaxProfiles = {},
                        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                        variables = {},
                    },
                })
            end,
        })
    end,
}
