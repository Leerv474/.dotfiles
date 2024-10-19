return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set("n", "<leader>e", function()
			vim.cmd.NvimTreeToggle()
		end, { desc = "Toggle file tree" })

		require("nvim-tree").setup({
			hijack_netrw = true,
			auto_reload_on_write = true,
            notify = {
                threshold = vim.log.levels.ERROR,
            },
			renderer = {
				group_empty = true,
			},
			view = {
				width = 40,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
            diagnostics = {
                enable = false,
            },
            log = {
                enable = false
            }
		})
	end,
}
