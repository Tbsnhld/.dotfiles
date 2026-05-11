vim.pack.add {
  "https://github.com/echasnovski/mini.icons",
  "https://github.com/stevearc/oil.nvim"
}
require("oil").setup()
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open the parent directory" })
