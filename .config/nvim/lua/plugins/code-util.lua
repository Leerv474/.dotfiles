return {
	{
		"echasnovski/mini.pairs",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = false, terminal = false },
				skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
				skip_ts = { "string" },
				skip_unbalanced = true,
				markdown = true,
			})
		end,
	},
	{
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
				},
				line_num = {
					enable = true,
					use_treesitter = true,
					style = "#a6adc8",
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			require("todo-comments").setup()

			vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>")
		end,
	},
}
