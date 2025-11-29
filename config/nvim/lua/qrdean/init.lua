require("qrdean.set")
require("qrdean.remap")
require("lazy-plugins")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
require("mason").setup()
require("mason-lspconfig").setup()

-- vim.g.godot_executable = '/Applications/Godot.app'
--
-- colorscheme catppuccin
-- vim.cmd.colorscheme "catppuccin-mocha"

-- vim.opt.background = "dark"
-- vim.cmd("colorscheme oxocarbon")

-- local oxocarbon = require("oxocarbon")
-- vim.api.nvim_set_hl(0, "TelescopeBorder", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopeNormal", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopePromptTitle", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopeSelection", {fg = oxocarbon.blend, bg = oxocarbon.blend})
-- vim.api.nvim_set_hl(0, "TelescopePreviewLine", {fg = oxocarbon.blend, bg = oxocarbon.blend})


-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
-- vim.g.gruvbox_baby_function_style = "NONE"
--
-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_transparent_mode = 0
--
-- colorscheme gruvbox-baby
vim.cmd([[
hi Comment cterm=italic gui=italic
]])
