vim.pack.add {
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons" 
}
require('lualine').setup({
  options = {
    icons_enabled = true,
  },
  sections = {
    lualine_c = {
      "filename",
      {
        "require'salesforce.org_manager':get_default_alias()",
        icon = "󰢎",
      }
    }
  }
})
