vim.loader.enable()

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

require("options")
require("keymaps")

require("plugins.treesitter")
require("plugins.lsp")
require("plugins.which-key")
require("plugins.ibl")
require("plugins.bufferline")
require("plugins.fzf-lua")
require("plugins.conform")
require("plugins.oil")
require("plugins.mini")
require("plugins.paredit")
