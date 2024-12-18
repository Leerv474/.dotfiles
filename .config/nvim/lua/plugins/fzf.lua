return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			"telescope",
			winopts = {
				height = 0.75,
				width = 0.70,
				border = "single",
				backdrop = 80,
				treesitter = {
					enabled = true,
					fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
				},
			},
			files = {
				prompt = "Files❯ ",
				path_shorten = 16,
				actions = { ["ctrl-g"] = false },
				cwd_prompt = false,
			},
		})

		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "fuzzy finder files" })
		vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "fuzzy finder files" })
		vim.keymap.set("n", "<leader>fs", fzf.grep, { desc = "fuzzy finder files" })
	end,
}
