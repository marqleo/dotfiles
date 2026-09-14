return {
	"fzf-lua",
	keys = {
		{ "<leader><space>", "<cmd>FzfLua files<CR>", desc = "Find files" },
		{ "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "Grep" },
		{ "<leader>,", "<cmd>FzfLua buffers<CR>", desc = "List buffers" },
		{ "<leader>R", "<cmd>FzfLua resume<CR>", desc = "Resume last picker" },
		
		-- LSP Integrations
		{ "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Go to definition" },
		{ "gD", "<cmd>FzfLua lsp_declarations<CR>", desc = "Go to declaration" },
		{ "gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Go to implementation" },
		{ "gr", "<cmd>FzfLua lsp_references<CR>", desc = "Go to references" },
		{ "<leader>ss", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document symbols" },
		{ "<leader>sS", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = "Workspace symbols" },
		{ "<leader>sd", "<cmd>FzfLua diagnostics_document<CR>", desc = "Document diagnostics" },
		{ "<leader>sD", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics" },
		
		-- Neovim Internals & Help
		{ "<leader>sh", "<cmd>FzfLua help_tags<CR>", desc = "Help tags" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<CR>", desc = "Search keymaps" },
		{ "<leader>sm", "<cmd>FzfLua marks<CR>", desc = "Search marks" },
		{ "<leader>sr", "<cmd>FzfLua registers<CR>", desc = "Search registers" },
		{ "<leader>sc", "<cmd>FzfLua command_history<CR>", desc = "Command history" },
		
		-- Git Integrations
		{ "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Git commits" },
		{ "<leader>gC", "<cmd>FzfLua git_bcommits<CR>", desc = "Git buffer commits" },
		{ "<leader>gb", "<cmd>FzfLua git_branches<CR>", desc = "Git branches" },
		{ "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Git status" },
	},
	after = function()
		require("fzf-lua").setup({})
	end,
}
