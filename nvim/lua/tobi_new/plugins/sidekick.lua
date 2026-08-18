vim.pack.add { "https://github.com/folke/sidekick.nvim" }
require("sidekick").setup({
  opts = {
    cli = {
      tools = {
        my_tool = {
          cmd = { "vibe", "--flag" },
          -- Optional: custom keymaps for this tool
          keys = {
            submit = { "<c-s>", function(t) t:send("\n") end },
          },
        },
      },
    },
  }

})
