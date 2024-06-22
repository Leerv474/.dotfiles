vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver30,r-cr-o:hor20"

-- netrw
vim.g.netrw_localcopydircmd = "cp -r"

--
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.mouse = ""
vim.opt.isfname:append("@-@")

vim.opt.number = true
vim.opt.relativenumber = true

-- -- enable if not using tabset.nvim
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.showtabline = 0

vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.wo.cursorline = true

vim.opt.wrap = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50

-- so split focuses new window
vim.opt.splitright = true
vim.opt.splitbelow = true

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

vim.g.omni_sql_no_default_maps = 1
