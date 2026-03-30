require("lz.n").load({
	{
		"indent-blankline.nvim",
		event = "VimEnter",
		after = function()
			require("ibl").setup({})
		end,
	},
})
