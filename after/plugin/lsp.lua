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
vim.lsp.enable("c3_lsp")

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
vim.lsp.enable("serve_d")

-- =======================
-- Standard servers
-- =======================
-- Kotlin
vim.lsp.config("kotlin_language_server", {
    capabilities = capabilities,
    init_options = { storagePath = "/home/chickencuber/.cache/nvim/kotlin" },
})
vim.lsp.enable("kotlin_language_server")

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    root_dir = function() return vim.fn.getcwd() end,
})
vim.lsp.enable("ts_ls")

-- C#
vim.lsp.config("omnisharp", {
    capabilities = capabilities,
    root_dir = function() return vim.fn.getcwd() end,
})
vim.lsp.enable("omnisharp")

-- C / C++
vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.enable("clangd")

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
vim.lsp.enable("rust_analyzer")

-- Lua
vim.lsp.config("lua_ls", {
    on_init = function(client)
        local path = client.workspace_folders and client.workspace_folders[1].name
        if path and path ~= vim.fn.stdpath("config") then
            if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = { version = "LuaJIT", path = { "lua/?.lua", "lua/?/init.lua" } },
            workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
        })
    end,
    settings = { Lua = {} },
})
vim.lsp.enable("lua_ls")

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

