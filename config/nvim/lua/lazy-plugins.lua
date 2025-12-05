local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'sheerun/vim-polyglot',

  {
    "wnkz/monoglow.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'luisiacc/gruvbox-baby',           branch = 'main' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'catppuccin/nvim',                 name = 'catppuccin', priority = 1000 },
  { 'rebelot/kanagawa.nvim' },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
  'norcalli/nvim-colorizer.lua',

  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope.nvim',
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    dependencies = {},
    opts = {}
  },

  'jiangmiao/auto-pairs',
  'tpope/vim-surround',

  { 'numToStr/Comment.nvim' },

  { 'ThePrimeagen/harpoon', branch = 'harpoon2', requires = { { 'nvim-lua/plenary.nvim' } } },

  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'junegunn/gv.vim',
  { 'sindrets/diffview.nvim',                     dependencies = 'nvim-lua/plenary.nvim' },

  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',

  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- 'Hoffs/omnisharp-extended-lsp.nvim',

  'neovim/nvim-lspconfig',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-path',
  'onsails/lspkind.nvim',
  'glepnir/lspsaga.nvim',

  'quangnguyen30192/cmp-nvim-tags',

  { 'nvim-treesitter/nvim-treesitter',            build = ':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },

  { 'nvim-lualine/lualine.nvim' },
  {
    'stevearc/oil.nvim',
    opts = {},
  },

  'folke/zen-mode.nvim',
  'folke/twilight.nvim',
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'folke/lazydev.nvim',
    ft = "lua",
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { "vim%.uv" } },
      },
    },
  },

  -- {
  --   'epwalsh/obsidian.nvim',
  --   lazy = true,
  --   event = {
  --     'BufReadPre ' .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/qthots/**.md",
  --     'BufNewFile ' .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/qthots/**.md",
  --   },
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   opts = {
  --     dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/qthots",
  --   },
  -- },

  -- lazy.nvim
  -- {
  --   "GustavEikaas/easy-dotnet.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
  --   config = function()
  --     require("easy-dotnet").setup()
  --   end
  -- },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    opts = {},
  },

  'mfussenegger/nvim-jdtls',

  'habamax/vim-godot',
  {
    "teatek/gdscript-extended-lsp.nvim", opts = {}
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  -- },
  -- {
  --   "Davidyz/VectorCode",
  --   version = "*",                     -- optional, depending on whether you're on nightly or release
  --   build = "pipx upgrade vectorcode", -- optional but recommended if you set `version = "*"`
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   cmd = "VectorCode",
  -- },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   config = true,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
    },
  },

  -- {
  --   'qdean_nvim/testplugin',
  --   -- config = function()
  --   --   require('testplugin').setup({ })
  --   -- end,
  --   dev = true
  -- },

}, {
  dev = {
    path = '~/projects/qdean_nvim',
    patterns = {},
    fallback = false,
  },
})
