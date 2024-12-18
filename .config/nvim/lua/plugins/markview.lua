return {
	"OXY2DEV/markview.nvim",
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("markview").setup()

		vim.keymap.set("n", "<leader>mv", ":Markview<CR>")
	end,
}
