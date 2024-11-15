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
require("config.autocmds")
require("config.set")
require("config.remap")
require("config.appearance")
require("lazy").setup("plugins", opts)

