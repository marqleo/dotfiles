return {
	"haskell-tools.nvim",
	ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
	after = function()
		-- haskell-tools.nvim will automatically find and start HLS
		-- for any haskell file you open.
		vim.g.haskell_tools = {
			hls = {
				capabilities = vim.lsp.protocol.make_client_capabilities(),
				settings = {
					haskell = {
						formattingProvider = "ormolu",
					},
				},
			},
		}
	end,
}
