vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver30,r-cr-o:hor20"

-- netrw
-- vim.g.netrw_localcopydircmd = "cp -r"
-- vim.g.netrw_banner = false;
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.mouse = ""
vim.opt.isfname:append("@-@")

vim.opt.number = true
vim.opt.relativenumber = true

-- -- enable if not using tabset.nvim
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.showtabline = 0

vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.wo.cursorline = true

vim.opt.wrap = false

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

-- so there is no fucking folding
vim.opt.foldenable = false;

vim.g.omni_sql_no_default_maps = 1

