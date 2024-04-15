return {
    'VonHeikemen/lsp-zero.nvim',
    branch = "v1.x",
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig', -- Required
        {                        -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        'williamboman/mason-lspconfig.nvim', -- Optional

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local lsp = require("lsp-zero")

        lsp.preset("recommended")
        require('mason').setup({
            opts = {
                ensure_installed = {
                    "codelldb",
                }
            }
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'tsserver',
                'rust_analyzer',
                'lua_ls',
                'pyright',
                'biome',
                'apex_ls',
                'clangd',
            },
            handlers = {
                lsp.default_setup,
            },
        })

        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            local toggleInlay = function()
                if client.server_capabilities.inlayHintProvider then
                    local current_value = vim.lsp.inlay_hint.get({ bufnr = 0 })[1]
                    vim.lsp.inlay_hint.enable(bufnr, not current_value)
                end
            end

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "go to Definition" }, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, { desc = "go to Implementation" },
                opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = 'open float' }, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "go to next diagnostic" }, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "go to prev diagnostic" }, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = 'code action' }, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
                { desc = 'Shows references of current value' },
                opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { desc = 'rename' }, opts)
            vim.keymap.set("n", "<leader>tI", toggleInlay, { desc = "toggle Inlay" }, opts)
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local apex_jar_path = vim.fn.stdpath("config") .. '/lspserver' .. 'apex-jorie-lsp.jar'
        require('lspconfig').apex_ls.setup {
            apex_jar_path = apex_jar_path,
            apex_enable_semantic_errors = false,
            apex_enable_completion_statistics = false,
            filetypes = { 'apex', 'apexcode' },
            on_attach = on_attach,
        }
        require('lspconfig').clangd.setup {
            on_attach = function(client, bufnr)
                client.server_capabilities.signatureHelpProvider = false
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
        }

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-Space>'] = cmp.mapping.complete(),
        })

        lsp.set_preferences({
            sign_icons = {}
        })
        cmp.setup({
            mapping = cmp_mappings
        })

        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            local toggleInlay = function()
                if client.server_capabilities.inlayHintProvider then
                    local current_value = vim.lsp.inlay_hint.get({ bufnr = 0 })[1]
                    vim.lsp.inlay_hint.enable(bufnr, not current_value)
                end
            end

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "go to Definition" }, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, { desc = "go to Implementation" },
                opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = 'open float' }, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "go to next diagnostic" }, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "go to prev diagnostic" }, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = 'code action' }, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
                { desc = 'Shows references of current value' },
                opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { desc = 'rename' }, opts)
            vim.keymap.set("n", "<leader>tI", toggleInlay, opts)
        end)
        lsp.setup()
    end
}
