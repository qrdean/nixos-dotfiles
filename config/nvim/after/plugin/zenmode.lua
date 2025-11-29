vim.keymap.set("n", "<leader>zz", function()
  require("zen-mode").setup({
    window = {
      width = 180,
      height = 1,
      options = {
        cursorcolumn = false,
        colorcolumn = "0",
        signcolumn = "no",
        number = false,
        relativenumber = false,
      }
    }
  })
  require("zen-mode").toggle()
end)
