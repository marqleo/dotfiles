local loaded = false
local function load()
	if loaded then
		return
	end
	vim.cmd("packadd fzf-lua")
	require("fzf-lua").setup({})
	loaded = true
end

vim.keymap.set("n", "<leader><space>", function()
	load()
	require("fzf-lua").files()
end, { silent = true, desc = "Find files" })
vim.keymap.set("n", "<leader>/", function()
	load()
	require("fzf-lua").live_grep()
end, { silent = true, desc = "Grep" })
vim.keymap.set("n", "<leader>,", function()
	load()
	require("fzf-lua").buffers()
end, { silent = true, desc = "List buffers" })
