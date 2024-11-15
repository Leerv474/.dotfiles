return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		local function on_attach(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end, { desc = "Format the current buffer with LSP" })
			end

			local bufopts = { noremap = true, silent = true, buffer = bufnr }

			vim.keymap.set(
				"n",
				"gR",
				"<cmd>Telescope lsp_references<CR>",
				vim.tbl_extend("force", bufopts, { desc = "List references" })
			)
			vim.keymap.set(
				"n",
				"gD",
				vim.lsp.buf.declaration,
				vim.tbl_extend("force", bufopts, { desc = "Go to declaration" })
			)
			vim.keymap.set(
				"n",
				"gd",
				"<cmd>Telescope lsp_definitions<CR>",
				vim.tbl_extend("force", bufopts, { desc = "List definitions" })
			)
			vim.keymap.set(
				"n",
				"gi",
				"<cmd>Telescope lsp_implementations<CR>",
				vim.tbl_extend("force", bufopts, { desc = "List implementations" })
			)
			vim.keymap.set(
				"n",
				"gt",
				"<cmd>Telescope lsp_type_definitions<CR>",
				vim.tbl_extend("force", bufopts, { desc = "List type definitions" })
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				vim.tbl_extend("force", bufopts, { desc = "Code actions" })
			)
			vim.keymap.set(
				"n",
				"<leader>rr",
				vim.lsp.buf.rename,
				vim.tbl_extend("force", bufopts, { desc = "Smart rename" })
			)
			vim.keymap.set(
				"n",
				"<leader>D",
				"<cmd>Telescope diagnostics bufnr=0<CR>",
				vim.tbl_extend("force", bufopts, { desc = "Show diagnostics for file" })
			)
			vim.keymap.set(
				"n",
				"<leader>d",
				vim.diagnostic.open_float,
				vim.tbl_extend("force", bufopts, { desc = "Show diagnostics for line" })
			)
			vim.keymap.set(
				"n",
				"[d",
				vim.diagnostic.goto_prev,
				vim.tbl_extend("force", bufopts, { desc = "Jump prev diagnostic" })
			)
			vim.keymap.set(
				"n",
				"]d",
				vim.diagnostic.goto_next,
				vim.tbl_extend("force", bufopts, { desc = "Jump next diagnostic" })
			)
			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				vim.tbl_extend("force", bufopts, { desc = "Documentation under cursor" })
			)
		end

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
		}

		for _, value in ipairs(lsplist) do
			lspconfig[value].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end
	end,
}
