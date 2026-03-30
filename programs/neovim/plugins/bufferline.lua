return {
	"bufferline.nvim",
	event = "VimEnter",
	after = function()
		require("bufferline").setup({
			options = {
				always_show_bufferline = false,
				numbers = "none",
				show_close_icon = false,
			},
		})

		vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>", { silent = true, desc = "Previous buffer" })
		vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>", { silent = true, desc = "Next buffer" })
		vim.keymap.set("n", "<leader>bp", "<cmd>:BufferLineTogglePin<CR>", { silent = true, desc = "Pin buffer" })
	end,
}
