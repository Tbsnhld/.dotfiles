return {
    "theprimeagen/harpoon",
    config = function()
        require("harpoon").setup({
            menu = {
                width = vim.api.nvim_win_get_width(0) - 40,
            }
        })


        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-h>", ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>hc", mark.clear_all)


        vim.keymap.set("n", "<C-m>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-n>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-e>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-i>", function() ui.nav_file(4) end)
    end
}
