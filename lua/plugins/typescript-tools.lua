return {
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},

	config = function(_, opts)
		opts.capabilities = capabilities

		opts.settings = vim.tbl_extend("force", opts.settings or {}, {
			publish_diagnostic_on = "change",
		})

		require("typescript-tools").setup(opts)
		local ts_tools = require("typescript-tools")
		local ts_api = require("typescript-tools.api")

		ts_tools.setup({
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,

			settings = {
				jsx_close_tag = {
					enable = true,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
			},

			handlers = {
				["textDocument/publishDiagnostics"] = ts_api.filter_diagnostics({
					6133, -- TS6133: 'X' is declared but its value is never read
					1005, -- TS1005: ';' expected
				}),
			},
		})
	end,

	opts = {},
}
