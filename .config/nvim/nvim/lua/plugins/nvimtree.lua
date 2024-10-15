return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set("n", "<leader>e", function()
			vim.cmd.NvimTreeToggle()
		end, { desc = "Toggle file tree" })

		require("nvim-tree").setup({
			hijack_netrw = true,
			auto_reload_on_write = true,
			renderer = {
				group_empty = true,
			},
		})
	end,
}