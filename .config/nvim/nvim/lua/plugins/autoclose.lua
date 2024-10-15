return {
    "m4xshen/autoclose.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("autoclose").setup({
            options = {
                disabled_filetypes = { "text", "markdown" },
            },
        })
    end,
}
