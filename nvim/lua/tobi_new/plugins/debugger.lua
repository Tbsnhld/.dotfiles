vim.pack.add { "https://github.com/mfussenegger/nvim-dap" }
vim.pack.add {
  --dependencies
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/nvim-neotest/nvim-nio",
  --plugin
  "https://github.com/jay-babu/mason-nvim-dap.nvim",
}
vim.pack.add { "https://github.com/rcarriga/nvim-dap-ui" }
local dap = require("dap")
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.open()
end
-- keymaps
vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line", })
vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger", })
