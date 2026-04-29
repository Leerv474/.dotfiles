return {
	"seblyng/roslyn.nvim",
	---@module 'roslyn.config'
	---@type RoslynNvimConfig
	opts = {
		-- your configuration comes here; leave empty for default settings
	},
	config = function()
		local lsp_options = require("config.lsp_options")
		vim.lsp.config("roslyn", {
			on_attach = lsp_options.on_attach,
			capabilities = lsp_options.capabilities,
			settings = {
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = true,
					csharp_enable_inlay_hints_for_implicit_variable_creation = true,
				},
				["csharp|code_lens"] = {
					dotnet_enable_references_code_lens = true,
				},
				["csharp|completion"] = {
					dotnet_show_completion_items_from_unimported_namespaces = true,
					dotnet_show_name_completion_suggestions = true,
				},
          ["csharp|background_analysis"] = {
                dotnet_analyzer_diagnostics_scope = "openFile",
                dotnet_compiler_diagnostics_scope = "fullSolution",
            },
			},
		})
		-- require("roslyn").setup()
	end,
}
