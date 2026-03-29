vim.api.nvim_create_autocmd("BufReadPre", {
	once = true,
	callback = function()
		vim.cmd("packadd conform.nvim")
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
})
