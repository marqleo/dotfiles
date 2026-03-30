require("lz.n").load({
	{
		"nvim-paredit",
		ft = { "clojure", "fennel", "janet", "scheme", "lisp" },
		after = function()
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
	},
})
