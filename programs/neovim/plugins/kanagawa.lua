return {
	"kanagawa.nvim",
	lazy = false,
	after = function()
		require("kanagawa").setup({})
		vim.cmd("colorscheme kanagawa")
	end,
}
