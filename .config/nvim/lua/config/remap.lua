vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- HJKL is too rare of a use case
vim.keymap.set("n", "H", "_")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "J", "<C-d>")
vim.keymap.set("n", "K", "<C-u>")

-- quickfix
vim.keymap.set("n", "<leader>cn", vim.cmd.cnext, { desc = "quickfix next" })
vim.keymap.set("n", "<leader>cp", vim.cmd.cprevious, { desc = "quickfix next" })
vim.keymap.set("n", "<leader>co", vim.cmd.copen, { desc = "quickfix open" })
vim.keymap.set("n", "<leader>cx", vim.cmd.cclose, { desc = "quickfix close" })
vim.keymap.set("n", "<leader>cc", "<cmd>call setqflist([], 'r')<cr>", { desc = "quickfix clear" })

vim.keymap.set("n", "<C-H>", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "<C-L>", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "<C-K>", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "<C-J>", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- split screen
vim.keymap.set("n", "<leader>sv", vim.cmd.vsplit, { desc = "split vertically" })
vim.keymap.set("n", "<leader>sh", vim.cmd.split, { desc = "split horizontally" })
vim.keymap.set("n", "<leader>sx", vim.cmd.close, { desc = "close scplit" })

vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious, { desc = "next buffer" })
vim.keymap.set("n", "<leader>bx", vim.cmd.bdelete, { desc = "next buffer" })

-- moving indent as much as you want
vim.keymap.set("v", "H", "<gv")
vim.keymap.set("v", "L", ">gv")

-- moving selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeping search results at the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- so paste over doesn't change registers 
vim.keymap.set("n", "<leader>d", '"_d', { desc = "delete without registering" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "delete without registering" })

-- paste over without buffering
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true })

-- better panes navigation
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- for reach projects
vim.keymap.set("n", "<leader>crc", ":!~/.dotfiles/scripts/create-react-component.sh")
