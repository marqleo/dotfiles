vim.api.nvim_create_autocmd("FileType", {
	pattern = { "clojure", "fennel", "janet", "scheme", "lisp" },
	once = true,
	callback = function()
		vim.cmd("packadd nvim-paredit")
		local paredit = require("nvim-paredit")
		paredit.setup({
			keys = {
				["<localleader>("] = {
					function()
						paredit.api.wrap_element_under_cursor("(", ")")
					end,
					"Wrap element in parens",
					mode = { "n" },
				},
				["<localleader>["] = {
					function()
						paredit.api.wrap_element_under_cursor("[", "]")
					end,
					"Wrap element in brackets",
					mode = { "n" },
				},
				["<localleader>{"] = {
					function()
						paredit.api.wrap_element_under_cursor("{", "}")
					end,
					"Wrap element in braces",
					mode = { "n" },
				},
			},
		})
	end,
})
