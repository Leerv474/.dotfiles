return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			"telescope",
			ui_select = true,
			winopts = {
				border = "single",
				preview = {
					border = "single", -- preview border: accepts both `nvim_open_win`
					scrollbar = "float", -- `false` or string:'float|border'
					-- float:  in-window floating border
					-- border: in-border "block" marker
					scrolloff = -1, -- float scrollbar offset from right
					-- applies only when scrollbar = 'float'
					delay = 20, -- delay(ms) displaying the preview
					-- prevents lag on fast scrolling
					winopts = { -- builtin previewer window options
						number = true,
						relativenumber = false,
						cursorline = true,
						cursorlineopt = "both",
						cursorcolumn = false,
						signcolumn = "no",
						list = false,
						foldenable = false,
						foldmethod = "manual",
					},
				},
			},
			files = {
				prompt = "Files❯ ",
				path_shorten = 16, -- 'true' or number, shorten path?
				cwd_prompt = false,
			},
		})

		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "fuzzy finder files" })
		vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "fuzzy finder files" })
		vim.keymap.set("n", "<leader>fs", fzf.grep, { desc = "fuzzy finder files" })
	end,
}
