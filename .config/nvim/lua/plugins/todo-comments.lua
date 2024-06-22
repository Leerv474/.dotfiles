return {
	-- adds highlights for comments marked
	-- TODO:
	-- FIX:
	-- HACK:
	-- NOTE:
	-- PERF:
	-- WARNING:
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},

	config = function()
		require("todo-comments").setup()
	end,
}
