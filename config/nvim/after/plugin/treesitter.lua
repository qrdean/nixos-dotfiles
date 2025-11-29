require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "vimdoc", "python", "bash", "javascript", "go", "java", "typescript", "lua", "rust", "gdscript", "godot_resource", "nix"},

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
