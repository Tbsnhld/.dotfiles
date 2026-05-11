local Path = require("plenary.path")
local img_penguin = "img_path"
local config_dir = vim.fn.stdpath("config")

local function get_variable_from_json(key)
  local path = Path:new(config_dir .. "/conf.json")
  if not path:exists() then
    return path, "File not found"
  end
  local content = path:read()
  local ok, decoded = pcall(vim.json.decode, content)
  if not ok then
    return nil, "Failed to parse JSON"
  end

  return decoded[key]
end

vim.pack.add { "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons" }
local Snacks = require("snacks")

Snacks.setup({
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 2 },
      { pane = 1, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
      {
        section = "terminal",
        cmd = "ascii-image-converter " .. get_variable_from_json(img_penguin) .. " -C -W 50 -m' &@#%8+=;:.'",
        random = 10,
        pane = 2,
        indent = 5,
        height = 30,
      },
    },
  },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  styles = {
    notification = {
      wo = { wrap = true }
    }
  }
})
