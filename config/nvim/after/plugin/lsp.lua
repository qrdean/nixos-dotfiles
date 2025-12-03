-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local util = require('lspconfig.util')
-- local opts = { noremap = true, silent = true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   local keymap = vim.keymap.set
--   -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   vim.lsp.inlay_hint.enable(false)
--   client.server_capabilities.semanticTokensProvider = nil
--
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap = true, silent = true, buffer = bufnr }
--   keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
--   keymap('n', 'K', vim.lsp.buf.hover, bufopts)
--   keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--   keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--   keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--   keymap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, bufopts)
--   keymap('n', 'gr', vim.lsp.buf.references, bufopts)
--   keymap('n', '<space>f', function()
--     vim.lsp.buf.format { async = true }
--   end, bufopts)
--   keymap('n', '<space>ih', function()
--     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
--   end, bufopts)
-- end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

vim.diagnostic.config({ jump = { float = true } })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local bufmap = function(mode, rhs, lhs)
      vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
    end

    -- bufmap('n', '[d', vim.diagnostic.get_next)
    -- bufmap('n', ']d', vim.diagnostic.get_prev)
    bufmap('n', 'gD', vim.lsp.buf.declaration)
    bufmap('n', 'gd', vim.lsp.buf.definition)
    bufmap('n', 'K', vim.lsp.buf.hover)
    bufmap('n', 'gi', vim.lsp.buf.implementation)
    bufmap('n', '<C-k>', vim.lsp.buf.signature_help)
    bufmap('n', '<space>D', vim.lsp.buf.type_definition)
    bufmap('n', '<space>rn', vim.lsp.buf.rename)
    bufmap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action)
    bufmap('n', 'gr', vim.lsp.buf.references)
    bufmap('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end)
    bufmap('n', '<space>ih', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end)
  end,
})


-- require('lspconfig')['lua_ls'].setup {
--   on_attach = on_attach,
--   settings = {
--     Lua = {
--       workspace = {
--         checkThirdParty = false,
--         telemetry = { enable = false },
--         library = {
--           "${3rd}/love2d/library"
--         }
--       },
--       diagnostics = {
--         globals = { 'vim' }
--       },
--       hint = {
--         enable = true
--       }
--     }
--   }
-- }

vim.lsp.config('lua_ls', {
  -- on_attach = on_attach,
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        telemetry = { enable = false },
        library = {
          "${3rd}/love2d/library"
        }
      },
      diagnostics = {
        globals = { 'vim' }
      },
      hint = {
        enable = true
      }
    }
  }
})
vim.lsp.enable({ "lua_ls" })


-- require('lspconfig')['gopls'].setup {
--   cmd = { "gopls", "serve" },
--   on_attach = on_attach,
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true
--       },
--       staticcheck = true,
--       hints = {
--         parameterNames = true
--       }
--     }
--   }
-- }

vim.lsp.config('gopls', {
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true
      },
      staticcheck = true,
      hints = {
        parameterNames = true
      }
    }
  }
})
vim.lsp.enable('gopls')

-- require('lspconfig')['rust_analyzer'].setup {
--   on_attach = on_attach,
--   flags = lsp_flags,
--   settings = {
--     ["rust_analyzer"] = {
--       imports = {
--         granularity = {
--           group = "module",
--         },
--         prefix = "self",
--       },
--       cargo = {
--         buildScripts = {
--           enable = true,
--         },
--       },
--       procMacro = {
--         enable = true,
--       },
--     }
--   }
-- }

vim.lsp.config('rust_analyzer', {
  flags = lsp_flags,
  settings = {
    ["rust_analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    }
  }
})
vim.lsp.enable('rust_analyzer')


-- local port = os.getenv 'GDScript_Port' or '6005'
-- local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
-- require('lspconfig').gdscript.setup {
--   on_attach = on_attach,
--   -- settings = {
--   --   cmd = cmd,
--   --   filetypes = { 'gd', 'gdscript', 'gdscript3' },
--   --   root_dir = util.root_pattern('project.godot', '.git'),
--   -- },
-- }

vim.lsp.config('gdscript', {})
vim.lsp.enable('gdscript')

-- require('lspconfig').clangd.setup {
--   on_attach = on_attach,
-- }
vim.lsp.config('clangd', {})
vim.lsp.enable('clangd')

-- require('lspconfig').pyright.setup{
--   on_attach = on_attach,
-- }

-- require('lspconfig').ocamllsp.setup {
--   on_attach = on_attach,
-- }


-- require('lspconfig').roslyn.setup {
--   on_attach = on_attach,
-- }
vim.lsp.config('roslyn', {})
vim.lsp.enable('roslyn')

-- local omnisharp_extended = require("omnisharp_extended")
-- local omnisharp_handlers = {
--   ["textDocument/definition"] = omnisharp_extended.definition_handler,
--   ["textDocument/references"] = omnisharp_extended.references_handler,
--   ["textDocument/implementation"] = omnisharp_extended.implementation_handler,
-- }
--
-- require('lspconfig').omnisharp.setup {
--   on_attach = on_attach,
--   handlers = omnisharp_handlers,
--   enable_editorconfig_support = true,
--   enable_roslyn_analyzers = true,
--   enable_import_completion = true,
--   sdk_include_preleases = true,
--   analyze_open_documents_only = true,
--   cmd = {"dotnet" ,"/home/qdean/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"}
-- }

-- require('lspconfig').ols.setup {
--   on_attach = on_attach,
-- }

vim.lsp.config('ols', {})
vim.lsp.enable('ols')

-- require('lspconfig').zls.setup {
--   on_attach = on_attach,
-- }

vim.lsp.config('zls', {})
vim.lsp.enable('ols')

vim.lsp.enable('jdtls')

vim.lsp.config('elixirls', {})
vim.lsp.enable('elixirls')

vim.lsp.config('nil_ls', {})
vim.lsp.enable('nil_ls')
