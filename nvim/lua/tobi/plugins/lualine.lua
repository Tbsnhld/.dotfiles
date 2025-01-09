return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
            },
            sections = {
                lualine_c = {
                    "filename",
                    {
                        "require'salesforce.org_manager':get_default_alias()",
                        icon = "󰢎",
                    }
                }
            }
        })
    end
}
