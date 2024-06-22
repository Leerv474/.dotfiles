return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local telescope = require("telescope")
        telescope.load_extension("ui-select")
        telescope.setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        preview_cutoff = 0,
                    },
                },
                path_display = { "smart" },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            },
        })
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({ hidden = true })
        end, { desc = "Find all files" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find git files" })

        vim.keymap.set("n", "<leader>fs", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Find string" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set(
            "n",
            "<leader>td",
            ":TodoTelescope<CR>",
            { desc = "Find TODO comments", noremap = true, silent = true }
        )
    end,
}
