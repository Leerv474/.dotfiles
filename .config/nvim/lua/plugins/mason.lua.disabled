return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim'
	},

	config = function()
		local mason = require("mason")
		local mason_config = require("mason-lspconfig")
        local mason_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "󰄳",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_config.setup({
			ensure_installed = {
				"cmake",
				"clangd",
				"pyright",
				"lua_ls",
				"jdtls",
				"cssls",
				"lemminx",
				"jsonls",
				"bashls",
				"marksman",
				"tsserver",
                "emmet_ls",
			},
		})

        mason_installer.setup({
            ensure_installer = {
                "prettier",
                "stylua",
                "isort",
                "black",
                "clang-format",
                "beautysh",
                -- linters
                "cpplint",
                "eslint_d",
                "checkstyle",
                "pylint",
                "luacheck",
            }
        })
	end,
}
