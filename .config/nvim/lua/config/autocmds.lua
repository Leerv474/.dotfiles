vim.cmd [[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'ftplugin.java'.setup_jdtls()
    augroup end
]]

local function change_dir_from_argv()
    local argv = vim.fn.argv()

    if #argv > 0 then
        local path = argv[1]

        local is_dir = vim.fn.isdirectory(path) == 1

        if is_dir then
            vim.cmd('cd ' .. path)
        end
    end
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = change_dir_from_argv
})
