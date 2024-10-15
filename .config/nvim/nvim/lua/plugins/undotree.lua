return {
	"mbbill/undotree",
    event = {"BufReadPre", "BufNewFile"},
	config = function()
        vim.keymap.set("n", "<leader>u", function()
            vim.cmd.UndotreeToggle()
            vim.cmd.UndotreeFocus()
        end, {desc = "Toggle undotree"})
	end,
}
