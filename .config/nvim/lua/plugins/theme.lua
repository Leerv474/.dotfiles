return {
    "folke/tokyonight.nvim",
    lazy = false,

    config = function()
        vim.cmd[[colorscheme tokyonight-night]]
        require("tokyonight").setup()
    end
}
