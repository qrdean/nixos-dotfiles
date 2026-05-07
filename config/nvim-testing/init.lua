vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.basics').setup()
require('mini.snippets').setup()
require('mini.completion').setup()
require('mini.cmdline').setup()
require('mini.git').setup()
require('mini.statusline').setup()
require('mini.pick').setup()
require('mini.diff').setup()

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                },
            }
        })
    end,
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
        Lua = {
            -- runtime = {
            -- 	version = 'LuaJIT',
            -- },
            diagnostics = {
                workspaceDelay = -1,
                globals = { 'vim' },
            },
        },
        workspace = {
            ignoreSubmodules = true,
            -- library = { vim.env.VIMRUNTIME },
            telemetry = { enable = false },
        },
        hint = {
            enable = true
        }
    },
})

vim.lsp.enable('lua_ls')

vim.lsp.config('clangd', {
    cmd = { 'clangd' },
    filetypes = { 'c', 'h' },
})
vim.lsp.enable('clangd')

vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>pf', function() vim.cmd('Pick files') end)
vim.keymap.set('n', '<Leader>rg', function() vim.cmd('Pick grep') end)
vim.keymap.set('i', 'jk', '<ESC>')


-- vim.o.autocomplete = true
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(ev)
-- 		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
-- 		if client:supports_method('textDocument/completion') then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf)
-- 		end
-- 	end,
-- })
--
-- vim.opt.complete:append('o')
-- vim.opt.completeopt = { 'menuone', 'noselect'}

-- print('loaded')

-- Colors

vim.cmd.colorscheme('miniautumn')
