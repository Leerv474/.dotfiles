-- change diagnostic signs
vim.cmd([[ 
    sign define DiagnosticSignError text=  linehl= texthl=DiagnosticSignError numhl= 
    sign define DiagnosticSignWarn text= linehl= texthl=DiagnosticSignWarn numhl= 
    sign define DiagnosticSignInfo text=  linehl= texthl=DiagnosticSignInfo numhl= 
    sign define DiagnosticSignHint text=  linehl= texthl=DiagnosticSignHint numhl= 
    ]])
vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        prefix = "  ",
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
})

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Highlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
    end,
})

