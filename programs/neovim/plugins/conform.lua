require("lz.n").load({
	{
		"conform.nvim",
		event = "BufReadPre",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ lsp_format = "fallback" })
				end,
				desc = "Format buffer",
			},
		},
		after = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					haskell = { "ormolu" },
					lua = { "stylua" },
					nix = { "nixfmt" },
				},
			})
		end,
	},
})
