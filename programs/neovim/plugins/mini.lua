vim.cmd("packadd mini.nvim")
require("mini.pairs").setup()

local paredit_langs = { "clojure", "fennel", "scheme", "lisp", "janet" }

vim.api.nvim_create_autocmd("FileType", {
	pattern = paredit_langs,
	callback = function()
		vim.b.minipairs_disable = true
	end,
})
