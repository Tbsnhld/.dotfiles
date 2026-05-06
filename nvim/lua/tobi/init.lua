require("tobi.config.set")
require("tobi.config.remap")

require("tobi.config.lazy_init")


vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python, rust, lua' },
  callback = function()
    vim.treesitter.start()
  end,
})

vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filepytes = { 'lua' },
  root_markers = { '.luarc.json', '.git' },
  settings = { Lua = { diagnostics = { globals = { "vim " } } } }
}

vim.lsp.enable('lua_ls')
