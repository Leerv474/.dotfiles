return {
	"saghen/blink.cmp",
	lazy = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"saghen/blink.compat",
	},
	version = "v0.*",

	opts = {
		keymap = { preset = "enter" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			min_keyword_length = 0,
			cmdline = {},
		},

		completion = {
			list = {
				selection = { preselect = false, auto_insert = false},
			},
		},
		signature = { enabled = true },
	},
}
