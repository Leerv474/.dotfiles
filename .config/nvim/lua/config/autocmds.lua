local function change_dir_from_argv()
	local argv = vim.fn.argv()

	if #argv > 0 then
		local path = argv[1]

		local is_dir = vim.fn.isdirectory(path) == 1

		if is_dir then
			vim.cmd("cd " .. path)
		end
	end
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = change_dir_from_argv,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		require("ftplugin.java").setup_jdtls()
	end,
})
