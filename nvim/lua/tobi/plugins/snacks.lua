return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = {
            {
                sections = {
                    { section = "header" },
                    {
                        pane = 2,
                        section = "terminal",
                        cmd = "colorscript -e square",
                        height = 5,
                        padding = 1,
                    },
                    { section = "keys", gap = 1, padding = 1 },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    { section = "startup" },
                },
            }
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
    },
    keys = {
        { "<leader>.",  function() Snacks.scratch() end,              desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end,       desc = "Select Scratch Buffer" },
        { "<leader>n",  function() Snacks.notifier.show_histor() end, desc = "Notification history" },
        { "<leader>gB", function() Snacks.gitbrowse() end,            desc = "Git Browse" },
        { "<leader>gb", function() Snacks.git.blame_line() end,       desc = "Git Blame Line" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end,     desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end,              desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end,          desc = "Lazygit log (cwd)" },
        { "<leader>un", function() Snacks.notifier.hide() end,        desc = "Dismiss Notifications" },
        { "<leader>N", function()
            Snacks.win({
                file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                width = 0.6,
                height = 0.6,
                wo = {
                    spell = false,
                    wrap = false,
                    signcolumn = "yes",
                    statuscolumn = " ",
                    conceallevel = 3,
                },
            })
        end,
        }
    }
}
