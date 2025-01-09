return {
    "jonathanmorris180/salesforce.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    dev = false,
    config = function()
        require("salesforce").setup({
            debug = {
                to_file = false,
                to_command_line = false,
            },
            popup = {
                -- The width of the popup window.
                width = 100,
                -- The height of the popup window.
                height = 20,
                -- The border characters to use for the popup window
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            file_manager = {
                ignore_conflicts = false, -- ignores conflicts on "sf project retrieve/deploy"
            },
            org_manager = {
                default_org_indicator = "󰄬",
            },
            -- Default SF CLI executable (should not need to be changed)
            sf_executable = "sf",
        })

        vim.keymap.set("n", "<leader>se", "<cmd>SalesforceExecuteFile<cr>")
        vim.keymap.set("n", "<leader>sc", "<cmd>SalesforceClosePopup<cr>")
        vim.keymap.set("n", "<leader>sS", "<cmd>SalesforceRefocusPopup<cr>")
        vim.keymap.set("n", "<leader>stm", "<cmd>SalesforceExecuteCurrentMethod<cr>")
        vim.keymap.set("n", "<leader>stc", "<cmd>SalesforceExecuteCurrentClass<cr>")
        vim.keymap.set("n", "<leader>sp", "<cmd>SalesforcePushToOrg<cr>")
        vim.keymap.set("n", "<leader>sr", "<cmd>SalesforceRetrieveFromOrg<cr>")
        vim.keymap.set("n", "<leader>sd", "<cmd>SalesforceDiffFile<cr>")
    end,}
