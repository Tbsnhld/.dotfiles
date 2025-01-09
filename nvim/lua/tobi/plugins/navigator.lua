return {
    "christoomey/vim-tmux-navigator",
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
    end,
}
