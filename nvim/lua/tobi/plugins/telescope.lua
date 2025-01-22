return {
    'nvim-telescope/telescope.nvim',

    tag = "0.1.5",

    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                sorting_strategy = "ascending",
                file_ignore_patterns = { 'node_modules/', 'release-definitions/' }
            },
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope git files" })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end, { desc = 'grep String' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    end
}
