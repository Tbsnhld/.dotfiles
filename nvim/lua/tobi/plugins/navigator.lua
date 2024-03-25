return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
        local g = vim.g
        g.tmux_navigator_no_mappings = 1
        g.tmux_navigator_disable_when_zoomed = 1

        vim.keymap.set("n", "<C-Left>", vim.cmd.TmuxNavigateLeft)
        vim.keymap.set("n", "<C-Up>", vim.cmd.TmuxNavigateUp)
        vim.keymap.set("n", "<C-Down>", vim.cmd.TmuxNavigateDown)
        vim.keymap.set("n", "<C-Right>", vim.cmd.TmuxNavigateRight)
    end,
}
