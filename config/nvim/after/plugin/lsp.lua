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
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   vim.lsp.inlay_hint.enable(false)
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

-- local lsp_flags = {
--   -- This is the default in Nvim 0.7+
--   debounce_text_changes = 150,
-- }

vim.lsp.config.lua_ls = {
  -- on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      hint = {
        enable = true
      }
    }
  }
}
vim.lsp.enable('lua_ls')

-- require('lspconfig')['lua_ls'].setup {
--   on_attach = on_attach,
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' }
--       },
--       hint = {
--         enable = true
--       }
--     }
--   }
-- }

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
