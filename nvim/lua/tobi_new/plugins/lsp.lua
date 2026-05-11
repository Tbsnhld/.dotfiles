vim.pack.add {
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
}

require("mason").setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "angularls" },
})


require('mason-tool-installer').setup { { ensure_installed = { "lua_ls", "angularls" } } }
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "go to Definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover" })
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = buf, desc = "go to Implementation" })
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = buf, desc = "open float" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { buffer = buf, desc = '[v] [c]ode [a]ction' })
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { buffer = buf, desc = '[G]oto [R]eferences' })
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { buffer = buf, desc = '[R]e[N]ame' })
    vim.keymap.set("n", '<leader>vtd', vim.lsp.buf.type_definition, { buffer = buf, desc = 'goto [T]ype [D]efinition' })
  end,
})

-- enable LSP (Neovim 0.10+ style)
vim.lsp.enable("lua_ls")
require("tobi_new.plugins.lsp.angularls")

-- global keymaps (simplest version)
