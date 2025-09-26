-- =======================
-- Capabilities for nvim-cmp
-- =======================
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require('cmp_nvim_lsp')
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- =======================
-- Keymaps on LspAttach
-- =======================
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    end,
})

-- =======================
-- Mason setup
-- =======================
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'eslint', 'lua_ls', 'omnisharp', 'ts_ls', 'clangd', 'kotlin_language_server' },
})

-- =======================
-- Custom servers
-- =======================
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')


-- c3_lsp
if not configs.c3_lsp then
    configs.c3_lsp = {
        default_config = {
            cmd = { "c3lsp" },
            filetypes = { "c3", "c3i" },
            root_dir = function(fname) return util.find_git_ancestor(fname) end,
            settings = {},
            name = "c3_lsp",
        }
    }
end
vim.lsp.config("c3_lsp", { capabilities = capabilities })

-- serve_d
if not configs.serve_d then
    configs.serve_d = {
        default_config = {
            cmd = { "serve-d" },
            filetypes = { "d" },
            root_dir = function(fname) return util.find_git_ancestor(fname) end,
            settings = {},
            name = "serve_d",
        }
    }
end
vim.lsp.config("serve_d", { capabilities = capabilities })

-- =======================
-- Standard servers
-- =======================
-- Kotlin
vim.lsp.config("kotlin_language_server", {
    capabilities = capabilities,
    init_options = { storagePath = "/home/chickencuber/.cache/nvim/kotlin" },
})

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    root_dir = function() return vim.fn.getcwd() end,
})

-- C#
vim.lsp.config("omnisharp", {
    capabilities = capabilities,
    root_dir = function() return vim.fn.getcwd() end,
})

-- C / C++
vim.lsp.config("clangd", { capabilities = capabilities })

-- Rust
vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            procMacro = { enable = true },
        },
    },
})

-- Lua
vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                then
                    return
                end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most
                    -- likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Tell the language server how to find Lua modules same way as Neovim
                    -- (see `:h lua-module-load`)
                    path = {
                        'lua/?.lua',
                        'lua/?/init.lua',
                    },
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                        -- Depending on the usage, you might want to add additional paths
                        -- here.
                        '${3rd}/luv/library',
                        '${3rd}/busted/library',
                    }
                    -- Or pull in all of 'runtimepath'.
                    -- NOTE: this is a lot slower and will cause issues when working on
                    -- your own configuration.
                    -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                    -- library = {
                        --   vim.api.nvim_get_runtime_file('', true),
                        -- }
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        })

-- =======================
-- Completion (cmp) setup
-- =======================
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
    },
})

