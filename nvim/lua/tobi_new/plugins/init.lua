-- Rust
---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end


-- Completion
vim.pack.add {
  -- dependencies
  gh 'hrsh7th/cmp-buffer',
  gh 'hrsh7th/cmp-path',
  gh 'hrsh7th/cmp-nvim-lsp',
  gh 'hrsh7th/cmp-nvim-lua',
  gh 'saadparwaiz1/cmp_luasnip',
  gh 'L3MON4D3/LuaSnip',
  gh 'rafamadriz/friendly-snippets',

  -- plugin
  gh 'hrsh7th/nvim-cmp'
}

local cmp = require('cmp')
local luasnip = require('luasnip')

require("luasnip.loaders.from_vscode")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})


require("tobi_new.plugins.clipboard")
require("tobi_new.plugins.colorscheme")
require("tobi_new.plugins.csvview")
require("tobi_new.plugins.debugger")
require("tobi_new.plugins.formatting")
require("tobi_new.plugins.fugitive")
require("tobi_new.plugins.gitsigns")
require("tobi_new.plugins.global_note")
require("tobi_new.plugins.linting")
require("tobi_new.plugins.lsp")
require("tobi_new.plugins.lualine")
require("tobi_new.plugins.mini")
require("tobi_new.plugins.oil")
require("tobi_new.plugins.plenary")
require("tobi_new.plugins.harpoon")
require("tobi_new.plugins.snacks")
require("tobi_new.plugins.telescope")
require("tobi_new.plugins.todo-comments")
require("tobi_new.plugins.treesitter")
require("tobi_new.plugins.undotree")
require("tobi_new.plugins.vim-illuminate")
require("tobi_new.plugins.whichkey")


