require('fzf-lua').setup({
  "default"
})

vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>FzfLua buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pf', '<cmd>FzfLua files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rg', '<cmd>FzfLua grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pr', '<cmd>FzfLua grep_cword<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pg', '<cmd>FzfLua grep_cWORD<cr>', { noremap = true })
