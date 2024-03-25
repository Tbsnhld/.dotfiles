function ColorMyPencil(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({

                flavour = "mocha",
                transparent_background = true,
                styles = {
                    functions = { "italic" },
                    keywords = { "bold" },
                },
                integrations = {
                    mason = true,
                    which_key = true,
                    telescope = { enabled = true },
                    harpoon = true,
                },
            })
            ColorMyPencil()
        end
    },
}
