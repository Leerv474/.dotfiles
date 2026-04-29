---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	config = function()
		local filetypes = {
			"java",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"html",
			"css",
			"javascript",
			"typescript",
			"typescriptreact",
			"javascriptreact",
			"json",
			"python",
			"xml",
			"sql",
			"json",
			"json5",
			"markdown",
			"razor",
			"cs",
      "hyprlang"
		}
		vim.cmd.syntax("off")
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			callback = function()
				-- local filetype = vim.bo.filetype
				-- if filetype == "neo-tree" or filetype == "fzf" then
				-- 	return
				-- end
				vim.treesitter.start()
			end,
		})
		local treesitter = require("nvim-treesitter")

		local parsers = {
			"java",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"jsx",
			"json",
			"python",
			"xml",
			"sql",
			"json",
			"json5",
			"markdown",
			"razor",
			"c_sharp",
			"hyprlang",
		}

		treesitter.install(parsers)
	end,
}
