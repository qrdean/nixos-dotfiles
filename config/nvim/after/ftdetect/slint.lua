vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.slint",
  command = "set filetype=slint",
})
