---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end
---@type (string|vim.pack.Spec)[]
local telescope_plugins = {
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-telescope/telescope.nvim',
  gh 'nvim-telescope/telescope-ui-select.nvim',
}

if vim.fn.executable 'make' == 1 then table.insert(telescope_plugins, gh 'nvim-telescope/telescope-fzf-native.nvim') end

-- NOTE: You can install multiple plugins at once
vim.pack.add(telescope_plugins)

require('telescope').setup({
  defaults = {
    sorting_strategy = "ascending",
    file_ignore_patterns = { 'node_modules/', 'release-definitions/' }
  },
  extensions = {
    ['ui-select'] = { require('telescope.themes').get_dropdown() },
  },
})
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'grep String' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
