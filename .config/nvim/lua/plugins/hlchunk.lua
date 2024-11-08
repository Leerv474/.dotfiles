return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				style = {
					{ fg = "#a6adc8" },
					{ fg = "#f38ba8" }, -- this fg is used to highlight wrong chunk
				},
			},
			indent = {
                enable = true,
                chars = {
                    "┊",
                },
            },line_num = {
				enable = true,
				use_treesitter = true,
				style = "#a6adc8",
			},
		})
	end,
}

