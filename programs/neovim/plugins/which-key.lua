return {
	"which-key.nvim",
	event = "VimEnter",
	after = function()
		require("which-key").setup({ preset = "helix" })
	end,
}
