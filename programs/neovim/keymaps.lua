-- General
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { silent = true, desc = "Quit All" })

-- Buffers
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { silent = true, desc = "Delete buffer" })

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right window" })
vim.keymap.set("n", "<leader>wd", "<cmd>q<CR>", { silent = true, desc = "Quit window" })
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { silent = true, desc = "Split window horizontally" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format buffer" })

-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

-- Autocomplete
vim.keymap.set("i", "<C-l>", "<C-x><C-o>", { desc = "Trigger completion" })
