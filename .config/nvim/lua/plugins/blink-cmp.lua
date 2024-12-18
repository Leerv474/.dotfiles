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

		highlight = {
			use_nvim_cmp_as_default = true,
		},
		nerd_font_variant = "mono",

		accept = { auto_brackets = { enabled = true } },
		trigger = { signature_help = { enabled = true } },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		windows = {
			autocomplete = {
				min_width = 15,
				max_height = 10,
				border = "none",
				winblend = 0,
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
				scrolloff = 2,
				scrollbar = true,
				direction_priority = { "s", "n" },
				auto_show = true,
				selection = "auto_insert",
				draw = "simple",
				cycle = {
					from_bottom = true,
					from_top = true,
				},
			},
			documentation = {
				min_width = 10,
				max_width = 60,
				max_height = 20,
				border = "padded",
				winblend = 0,
				winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				scrollbar = true,
				direction_priority = {
					autocomplete_north = { "e", "w", "n", "s" },
					autocomplete_south = { "e", "w", "s", "n" },
				},
				auto_show = false,
				auto_show_delay_ms = 500,
				update_delay_ms = 50,
			},
			signature_help = {
				min_width = 1,
				max_width = 100,
				max_height = 10,
				border = "padded",
				winblend = 0,
				winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
				scrollbar = false,

				direction_priority = { "n", "s" },
			},
			ghost_text = {
				enabled = false,
			},
		},
	},
}
