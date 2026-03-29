vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local ok = pcall(vim.treesitter.start)
		if not ok then
			-- no parser available for this filetype, silently ignore
		end
	end,
})
