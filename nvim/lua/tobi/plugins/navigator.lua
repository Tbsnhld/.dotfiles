return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateRight",
        "TmuxNavigateUp",
    },
    keys = {
        { "<c-Left>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-Down>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-Up>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-Right>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
    config = function()
        local g = vim.g
        g.tmux_navigator_no_mappings = 1
        g.tmux_navigator_disable_when_zoomed = 1

        vim.keymap.set("n", "<c-Left>", vim.cmd.TmuxNavigateLeft)
        vim.keymap.set("n", "<c-Up>", vim.cmd.TmuxNavigateUp)
        vim.keymap.set("n", "<c-Down>", vim.cmd.TmuxNavigateDown)
        vim.keymap.set("n", "<c-Right>", vim.cmd.TmuxNavigateRight)
    end,
}
