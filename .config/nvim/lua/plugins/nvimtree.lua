---@diagnostic disable: missing-fields
return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,

    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
        vim.keymap.set("n", "<leader>nt", function()
            vim.cmd.NvimTreeToggle()
        end, {desc = "Toggle file tree"})
    end,
}
