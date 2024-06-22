---@diagnostic disable: missing-fields
return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"ray-x/lsp_signature.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu, menuone, preview, noselect",
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = {
				{ name = "nvim_lsp", priority = 40 },
				{ name = "luasnip", priority = 30 },
				{ name = "buffer", priority = 20},
				{ name = "path", priority = 10},
                { name = "vim-dadbod-completion", priority = 50},
			},
			formatting = {
				format = lspkind.cmp_format({
					maxWidth = 50,
					ellipsis_chat = "...",
				}),
			},
		})

		require("lsp_signature").setup({
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			hint_enable = false,
		})
	end,
}
