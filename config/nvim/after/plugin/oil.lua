require("oil").setup()
local opts = { noremap = true }
vim.keymap.set("n", "<leader>t", '<cmd>Oil<cr>', opts)
