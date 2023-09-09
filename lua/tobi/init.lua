
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    'wbthomason/packer.nvim',
    {
	  'nvim-telescope/telescope.nvim', version = '0.1.2',
	  -- or                            , branch = '0.1.x',
	 dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "savq/melange-nvim",
        lazy = false,
    },
    
   'nvim-lua/plenary.nvim',
   'ThePrimeagen/vim-be-good', 
   {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
   'theprimeagen/harpoon',
   'mbbill/undotree', 
   'nvim-treesitter/nvim-treesitter-context',
   'tpope/vim-fugitive',
   {
      'VonHeikemen/lsp-zero.nvim',
      dependencies = {
          -- LSP Support
          'neovim/nvim-lspconfig',             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          build = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
          },
          'williamboman/mason-lspconfig.nvim', -- Optional

           -- Autocompletion
           'hrsh7th/nvim-cmp',
           'hrsh7th/cmp-buffer',
	       'hrsh7th/cmp-path',
	       'saadparwaiz1/cmp_luasnip',
	       'hrsh7th/cmp-nvim-lsp',
	       'hrsh7th/cmp-nvim-lua',

	       -- Snippets
	       'L3MON4D3/LuaSnip',
           'rafamadriz/friendly-snippets',
          },
       },
    {
      "lewis6991/gitsigns.nvim",
        config = function ()
            require("gitsigns").setup()
        end
    },
})

require("tobi.plugin_config")
require("tobi.remap")
require("tobi.set")



