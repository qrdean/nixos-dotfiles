-- vim.o.background = ""

-- require('kanagawa').setup({
--   compile = false,
--   colors = {
--     theme = {
--       all = {
--         ui = {
--           bg_gutter = "none"
--         }
--       }
--     }
--   },
--   overrides = function(colors)
--     return {
--       Normal = { bg = "none" },
--       NormalFloat = { bg = "none" },
--       FloatBorder = { bg = "none" },
--       FloatTitle = { bg = "none" },
--     }
--   end
-- })
--
-- vim.cmd.colorscheme "kanagawa-dragon"

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
})
--
vim.cmd.colorscheme "catppuccin"
