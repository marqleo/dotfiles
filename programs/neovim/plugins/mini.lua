return {
	"mini.nvim",
	event = "BufReadPre",
	after = function()
		require("mini.pairs").setup()

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "clojure", "fennel", "scheme", "lisp", "janet" },
			callback = function()
				vim.b.minipairs_disable = true
			end,
		})
	end,
}
