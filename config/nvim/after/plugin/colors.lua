require('kanagawa').setup({
  compile = false,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  },
  -- overrides = function(colors)
  --   return {
  --     Normal = { bg = "none" },
  --     NormalFloat = { bg = "none" },
  --     FloatBorder = { bg = "none" },
  --     FloatTitle = { bg = "none" },
  --   }
  -- end
})

require('kanso').setup({
  transparent = false,
  theme = 'zen',
  background = {
    dark = 'zen'
  }
})

-- vim.cmd.colorscheme "kanagawa-dragon"
vim.cmd.colorscheme 'kanso'

-- require("catppuccin").setup({
--   flavour = "mocha",
--   transparent_background = true,
-- })
--
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "monoglow"
--
