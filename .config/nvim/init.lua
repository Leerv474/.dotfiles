---@diagnostic disable: missing-fields, undefined-global
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    change_detection = {
        notify = false
    },
    cheker = {
        enabled = true,
        notify = false
    }
}

vim.g.mapleader = " "
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
require("config.set")
require("config.autocmds")
require("config.remap")
require("config.appearance")
require("lazy").setup("plugins", opts)

