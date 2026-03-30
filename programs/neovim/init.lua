vim.loader.enable()

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

require("options")
require("keymaps")

require("lz.n").load("plugins")
