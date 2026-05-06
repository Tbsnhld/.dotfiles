return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },

  config = function()
    require("mason").setup()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" },
    })

    -- enable LSP (Neovim 0.10+ style)
    vim.lsp.enable("lua_ls")

    -- global keymaps (simplest version)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to Definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "go to Implementation" })
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "open float" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)
  end,


}
