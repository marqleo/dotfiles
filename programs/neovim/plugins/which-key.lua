vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.cmd("packadd which-key.nvim")
		require("which-key").setup({ preset = "helix" })
	end,
})
