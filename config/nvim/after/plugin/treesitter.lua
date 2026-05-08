-- require 'nvim-treesitter'.setup {
--   ensure_installed = { "vimdoc", "python", "bash", "javascript", "go", "java", "typescript", "lua", "rust", "gdscript", "godot_resource", "slint", "c_sharp", "odin", "zig", "markdown", "c", "cpp" },
--
--   highlight = {
--     enable = true,
--   },
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = "gnn",
--       node_incremental = "grn",
--       scope_incremental = "grc",
--       node_decremental = "grm",
--     }
--   },
--   textobjects = {
--     select = {
--       enable = true,
--       keymaps = {
--         ["af"] = "@functional.outer",
--         ["if"] = "@functional.inner",
--         ["ab"] = "@block.outer",
--         ["ib"] = "@block.inner",
--         ["as"] = "@statement.outer",
--         ["is"] = "@statement.inner",
--       }
--     }
--   }
-- }

-- new
-- "gdscript" was fighting with the ftplugin so moved it out
local ensure_installed = { "vimdoc", "python", "bash", "javascript", "go", "java", "typescript", "lua", "rust",
  "godot_resource", "c_sharp", "odin", "zig", "markdown", "c", "cpp" }
local _treesitter = require("nvim-treesitter")
_treesitter.install(ensure_installed)
_treesitter.setup()
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = ensure_installed,
  callback = function(event)
    vim.treesitter.start(event.buf)
  end
})
