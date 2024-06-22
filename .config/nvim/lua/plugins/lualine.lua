return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "abeldekat/harpoonline",
    },

    priority = 1000,

    config = function()
        -- sections
        local mode = {
            "mode",
            separator = { left = "" },
            padding = { right = 2, left = 1 },
        }
        local location = {
            "location",
            separator = { right = "" },
            padding = { left = 1, right = 1 },
        }

        local diff = {
            "diff",
            icon = "",
            colored = true,
            symbols = { added = " ", modified = "󰛿 ", removed = " " },
            source = nil,
        }

        local filetype = {
            "filetype",
            colored = true,
            icon_only = true,
            separator = {},
            padding = { right = 0 },
        }
        local filename = {
            "filename",
            file_status = false,
            newfile_status = false,
            path = 0, -- 0: Just the filename

            shorting_target = 40,
            symbols = {
                modified = "  ",
                readonly = "  ",
                unnamed = "[No Name]",
                newfile = "[New]",
            },
            padding = { right = 2 },
        }

        local harpoonline = require("harpoonline")
        harpoonline.setup({
            on_update = function()
                require("lualine").refresh()
            end,
            formatter_opts = {
                extended = {
                    indicators = { " 1 ", " 2 ", " 3 ", " 4 " },
                    empty_slot = " · ",
                    more_marks_indicator = "…",
                    more_marks_active_indicator = "[…]",
                },
            },
        })

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { "branch", diff, "diagnostics" },
                lualine_c = {},
                lualine_x = { filetype, filename },
                lualine_y = { harpoonline.format },
                lualine_z = { location },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { filetype, filename },
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
