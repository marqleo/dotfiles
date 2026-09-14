return {
	"mini.nvim",
	after = function()
		require("mini.icons").setup()
		require("mini.icons").mock_nvim_web_devicons()
		require("mini.pairs").setup()

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "clojure", "fennel", "scheme", "lisp", "janet" },
			callback = function()
				vim.b.minipairs_disable = true
			end,
		})
	end,
}
