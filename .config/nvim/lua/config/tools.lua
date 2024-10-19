
vim.keymap.set("v", "'", [[c'<C-r>"'<Esc>]], { desc = "Surround selection with '" })
vim.keymap.set("v", '"', [[c"<C-r>""<Esc>]], { desc = 'Surround selection with "' })
vim.keymap.set("v", '*', [[c*<C-r>"*<Esc>]], { desc = "Surround selection with *" })
vim.keymap.set("v", '`', [[c`<c-r>"`<esc>]], { desc = "surround selection with `" })

vim.keymap.set("v", '(', [[c(<c-r>")<esc>]], { desc = "surround selection with ()" })
vim.keymap.set("v", ')', [[c(<c-r>")<esc>]], { desc = "surround selection with ()" })

vim.keymap.set("v", '{', [[c{<c-r>"}<esc>]], { desc = "surround selection with {}" })
vim.keymap.set("v", '}', [[c{<c-r>"}<esc>]], { desc = "surround selection with {}" })

vim.keymap.set("v", '<', [[c<<c-r>"><esc>]], { desc = "surround selection with <>" })
vim.keymap.set("v", '>', [[c<<c-r>"><esc>]], { desc = "surround selection with <>" })


