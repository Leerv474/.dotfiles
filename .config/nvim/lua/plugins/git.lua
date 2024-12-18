return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup()

			vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk_inline)
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		cmd = {
			"LazyGit",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<CR>", desc = "open lazygit" },
		},
	},
}
