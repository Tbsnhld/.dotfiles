vim.pack.add { "https://github.com/HimadriChakra12/excel.nvim" }
local excel = require("excel")
excel.setup({
  python_cmd = 'python3',

  max_col_width = 20,
  min_col_width = 8,
  show_gridlines = true,
  show_formulas = false,

  auto_recalc = false,

  date_format = "%Y-%m-%d",
  number_format = "%.2f",
  cell_padding = 1,
})
