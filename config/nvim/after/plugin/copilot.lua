require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      next = "<M-j>",
      prev = "<M-k>",
      dismiss = "<C-]>",
    }
  },
})

