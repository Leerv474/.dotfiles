---@diagnostic disable: missing-fields
return {
    "shellraining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local hlchunk = require("hlchunk")
        hlchunk.setup({
            context = {},
            chunk = {
                enable = true,
                notify = true,
                use_treesitter = true,
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "╭",
                    left_bottom = "╰",
                    right_arrow = ">",
                },
                style = {
                    { fg = "#a6adc8" },
                    { fg = "#f38ba8" }, -- this fg is used to highlight wrong chunk
                },
                textobject = "",
                max_file_size = 1024 * 1024 * 1024,
                error_sign = true,
            },

            indent = {
                enable = true,
                use_treesitter = true,
                chars = {
                    "┊",
                },
            },

            line_num = {
                enable = true,
                use_treesitter = true,
                style = "#a6adc8",
            },

            blank = {
                enable = false,
            },
        })
    end,
}
