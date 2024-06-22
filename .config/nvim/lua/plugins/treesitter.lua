---@diagnostic disable: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "theHamsta/nvim-treesitter-pairs",
    },

    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            ensure_installed = {
                "java",
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "bash",
                "html",
                "css",
                "javascript",
                "json",
                "python",
                "xml",
                "sql",
                "json",
                "json5",
                "markdown",
            },

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_filesize = 1024 * 1024 * 1024 -- 1000 KB
                    local filename = vim.api.nvim_buf_get_name(buf)
                    local ok, stats = pcall(vim.uv.fs_stat, filename)
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },

            pairs = {
                enable = true,
                disable = {},
                highlight_pair_events = {},
                highlight_self = true,
                goto_right_end = false,
                fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')",
                keymaps = {
                    goto_partner = "<leader>%",
                    delete_balanced = "X",
                },
                delete_balanced = {
                    only_on_first_char = false,
                    fallback_cmd_normal = nil,
                    longest_partner = false,
                },
            },
        })
    end,
}
