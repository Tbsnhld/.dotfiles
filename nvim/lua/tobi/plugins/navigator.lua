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
        { "<C-Left>",  "<cmd>TmuxNavigateLeft<cr>" },
        { "<C-Down>",  "<cmd>TmuxNavigateDown<cr>" },
        { "<C-Up>",    "<cmd>TmuxNavigateUp<cr>" },
        { "<C-Right>", "<cmd>TmuxNavigateRight<cr>" },
    },
    init = function()
        vim.g.tmux_navigator_no_mappings = 1
        vim.keymap.set("n", "<C-Left>", vim.cmd.TmuxNavigateLeft)
        vim.keymap.set("n", "<C-Up>", vim.cmd.TmuxNavigateUp)
        vim.keymap.set("n", "<C-Down>", vim.cmd.TmuxNavigateDown)
        vim.keymap.set("n", "<C-Right>", vim.cmd.TmuxNavigateRight)
    end,
}
