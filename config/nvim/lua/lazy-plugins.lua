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
  -- 'nvim-tree/nvim-tree.lua',

  { 'luisiacc/gruvbox-baby',           branch = 'main' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'catppuccin/nvim',                 name = 'catppuccin', priority = 1000 },
  { 'rebelot/kanagawa.nvim' },

  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope.nvim',

  'jiangmiao/auto-pairs',
  'tpope/vim-surround',

  { 'numToStr/Comment.nvim' },

  -- 'ThePrimeagen/harpoon',
  { 'ThePrimeagen/harpoon', branch = 'harpoon2', requires = { { 'nvim-lua/plenary.nvim' } } },

  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'junegunn/gv.vim',
  { 'sindrets/diffview.nvim',                     dependencies = 'nvim-lua/plenary.nvim' },

  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter"
    -- config = function()
    --   require("copilot").setup({})
    -- end
  },

  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',

  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- 'williamboman/nvim-lsp-installer',

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
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'epwalsh/obsidian.nvim',
    lazy = true,
    event = {
      'BufReadPre ' .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/qthots/**.md",
      'BufNewFile ' .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/qthots/**.md",
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/qthots",
    },
  },

  'mfussenegger/nvim-jdtls',

  'habamax/vim-godot',

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
    },
  },
})
