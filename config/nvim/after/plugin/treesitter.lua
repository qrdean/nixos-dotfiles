require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "vimdoc", "python", "bash", "javascript", "go", "java", "typescript", "lua", "rust", "gdscript", "godot_resource", "slint", "c_sharp", "odin", "zig", "markdown", "c", "cpp" },

  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@functional.outer",
        ["if"] = "@functional.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.inner",
      }
    }
  }
}

-- new
-- local ensure_installed = { "vimdoc", "python", "bash", "javascript", "go", "java", "typescript", "lua", "rust",
--   "gdscript", "godot_resource", "slint", "c_sharp", "odin", "zig", "markdown", "c", "cpp" }
-- local _treesitter = require("nvim-treesitter")
-- _treesitter.setup()
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = ensure_installed,
--   callback = function(event)
--     vim.treesitter.start()
--   end
-- })
