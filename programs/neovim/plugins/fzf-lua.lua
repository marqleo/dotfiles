return {
	"fzf-lua",
	keys = {
		{ "<leader><space>", "<cmd>FzfLua files<CR>", desc = "Find files" },
		{ "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "Grep" },
		{ "<leader>,", "<cmd>FzfLua buffers<CR>", desc = "List buffers" },
	},
	after = function()
		require("fzf-lua").setup({})
	end,
}
