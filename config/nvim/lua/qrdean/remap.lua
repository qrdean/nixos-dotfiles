local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
vim.g.mapleader = " "

keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

keymap('i', 'jk', '<ESC>', opts)
keymap('n', '<leader>ve', '<cmd>e ~/.config/nvim/init.lua<Cr>', opts)
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)
keymap('n', '<C-i>', '<C-i>zz', opts)
--keymap('n', 'N', 'Nzzzv', opts)
--keymap('n', 'n', 'nzzzv', opts)
keymap('n', "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})



-- Copilot
-- keymap('i', '<C-Bslash>', '<cmd>call copilot#Suggest()<Cr>', opts)
-- keymap('i', '<M-j>', '<cmd>call copilot#Previous()<Cr>', opts)
-- keymap('i', '<M-h>', '<cmd>call copilot#Next()<Cr>', opts)
