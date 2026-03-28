vim.cmd("packadd bufferline.nvim")
require("bufferline").setup({
  options = {
    always_show_bufferline = false,
    numbers = "none",
    show_close_icon = false,
  },
})
