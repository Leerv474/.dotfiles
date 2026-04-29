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
			default_component_configs = {
				type = { enabled = false },
				file_size = { enabled = false },
			},
			filesystem = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time the current file is changed
					leave_dirs_open = false, -- `false` closes auto-opened dirs when moving to a new file
				},
				group_empty_dirs = false,
				filtered_items = {
					visible = false, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false, -- only works on Windows for hidden files/directories
					hide_by_name = {
						"bin",
						"obj",
					},
				},

				window = {
					position = "float",
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
