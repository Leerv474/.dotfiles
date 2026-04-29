return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()

		local lsplist = {
			"lua_ls",
			"pyright",
			"ts_ls",
			"eslint",
			"jsonls",
			"html",
			"cssls",
			"marksman",
			"sqls",
			"yamlls",
			"lemminx",
			"clangd",
			"gopls",
			"rust_analyzer",
			"checkmate",
		}

    local lsp_options = require("config.lsp_options")

		for _, value in ipairs(lsplist) do
			vim.lsp.config(value, {
				on_attach = lsp_options.on_attach,
				capabilities = lsp_options.capabilities,
			})
		end

	end,
}
