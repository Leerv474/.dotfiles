---@diagnostic disable: missing-fields, undefined-global
return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
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
					"ts_ls",
					"sqls",
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
				},
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",

		config = function()
			local mason_dap = require("mason-nvim-dap")
			mason_dap.setup({
				ensure_installed = {
					"java-debug-adapter",
					"java-test",
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
}
