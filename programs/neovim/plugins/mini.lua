vim.api.nvim_create_autocmd("BufReadPre", {
	once = true,
	callback = function()
		vim.cmd("packadd mini.nvim")
		require("mini.pairs").setup()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "clojure", "fennel", "scheme", "lisp", "janet" },
	callback = function()
		vim.b.minipairs_disable = true
	end,
})
