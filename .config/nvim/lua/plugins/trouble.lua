return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>ta", function()
            trouble.toggle()
        end)
        vim.keymap.set("n", "<leader>td", function()
            trouble.toggle("document_diagnostics")
        end, { desc = "trouble document diagnostics" })
        vim.keymap.set("n", "<leader>tq", function()
            trouble.toggle("quickfix")
        end, { desc = "trouble quickfix" })
    end,
}
