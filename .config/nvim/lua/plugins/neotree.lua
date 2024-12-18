return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			source_selector = {
				winbar = false,
				statusline = false,
			},
			filesystem = {
				group_empty_dirs = false,
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false, -- only works on Windows for hidden files/directories
				},

				window = {
					mappings = {
						["<bs>"] = "",
						["/"] = "",
						["."] = "",
						["[g"] = "",
						["]g"] = "",
						["o"] = "",
						["oc"] = "",
						nowait = false,
						["od"] = "",
						["og"] = "",
						["om"] = "",
						["on"] = "",
						["os"] = "",
						["ot"] = "",
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "toggle neotree", silent = true })
		vim.keymap.set("n", "<leader>pv", ":Neotree focus<CR>", { desc = "toggle neotree", silent = true })
	end,
}
