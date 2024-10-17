vim.cmd [[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'ftplugin.java'.setup_jdtls()
    augroup end
]]
