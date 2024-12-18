return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	config = function()
		require("refactoring").setup({
			prompt_func_return_type = {
				go = false,
				java = true,

				cpp = true,
				c = true,
				h = true,
				hpp = true,
				cxx = false,
			},
			prompt_func_param_type = {
				go = false,
				java = true,

				cpp = true,
				c = true,
				h = true,
				hpp = true,
				cxx = false,
			},
			printf_statements = {},
			print_var_statements = {},
			show_success_message = false, -- shows a message with information about the refactor on success
			-- i.e. [Refactor] Inlined 3 variable occurrences
		})
	end,
}
