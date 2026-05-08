vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter"}, {
  pattern = "*.gd",
  callback = function(event)
    vim.cmd('set filetype=gdscript')
    vim.treesitter.start(event.buf)
  end
})
