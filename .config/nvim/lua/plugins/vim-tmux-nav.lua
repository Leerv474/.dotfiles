return {
	"christoomey/vim-tmux-navigator",
	config = function()
		vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true})
		vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true})
		vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true})
		vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true})
	end,
}
