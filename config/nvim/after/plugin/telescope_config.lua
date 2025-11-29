local icons = require('qrdean.icons')
local border = icons.borders
local actions = require("telescope.actions")
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-x>"] = actions.delete_buffer,
      }
    },
    layout_strategy = 'horizontal',
    layout_config = {
      height = 0.60,
      width = 0.95,
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    path_display = { "filename_first" },

    borderchars = {
      border.DoubleHorizontalEdge,
      border.DoubleVerticalEdge,
      border.DoubleHorizontalEdge,
      border.DoubleVerticalEdge,
      border.DoubleTopLeftCorner,
      border.DoubleTopRightCorner,
      border.DoubleBottomRightCorner,
      border.DoubleBottomLeftCorner
    }
  }
})

function TelescopeConfigs()
  require('telescope.builtin').find_files {
    prompt_title = 'Config files',
    results_title = 'Config Files Results',
    path_display = { 'smart', 'shorten' },
    search_dirs = {
      '~/.config/nvim',
      '~/.zshrc',
    }
  }
end

function Grep()
  require('telescope.builtin').grep_string {
    search = vim.fn.expand("<cword>")
  }
end

-- local pickers = require('telescope.pickers')
-- local finders = require('telescope.finders')
-- local sorters = require('telescope.sorters')
--
-- local input = {'1','2','3'}
-- local opts = {
--   finder = input,
--   sorter = sorters.get_generic_fuzzy_sorter(),
-- }
--
-- function RunThing()
--   local picker = pickers.new(opts)
--   picker:find()
-- end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
--keymap('n', '<Leader>pp', '<CMD>lua require('telescope.builtin').builtin()<CR>', opts)
keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>cf', ':lua TelescopeConfigs()<cr>', opts)
keymap('n', '<leader>m', '<cmd>Telescope oldfiles<cr>', opts)
keymap('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts)
keymap('n', '<leader>gf', '<cmd>Telescope git_files<cr>', opts)
keymap('n', '<leader>pf', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>pr', ':lua Grep()<cr>', opts)
keymap('n', '<leader>rg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>vh', '<cmd>Telescope help_tags<cr>', opts)
