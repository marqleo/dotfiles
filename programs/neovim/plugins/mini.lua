return {
	"mini.nvim",
	after = function()
		require("mini.icons").setup()
		require("mini.icons").mock_nvim_web_devicons()
		require("mini.pairs").setup()

		require("mini.surround").setup()
		require("mini.ai").setup()
		require("mini.statusline").setup({
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local diff = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location = MiniStatusline.section_location({ trunc_width = 75 })
					local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

					local lsp_progress = vim.lsp.status()

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
						"%<", -- Mark general truncate point
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- End left alignment
						{ hl = "MiniStatuslineFileinfo", strings = { lsp_progress, fileinfo } },
						{ hl = mode_hl, strings = { search, location } },
					})
				end,
			},
		})

		vim.api.nvim_create_autocmd("LspProgress", {
			callback = function()
				vim.cmd("redrawstatus")
			end,
		})
		require("mini.diff").setup()
		require("mini.files").setup()
		require("mini.git").setup()

		vim.keymap.set("n", "<leader>e", function()
			require("mini.files").open()
		end, { desc = "Open file explorer" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "clojure", "fennel", "scheme", "lisp", "janet" },
			callback = function()
				vim.b.minipairs_disable = true
			end,
		})
	end,
}
