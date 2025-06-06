local lsp = require('lsp-zero')

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.lsp.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.lsp.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local configs = require('lspconfig.configs')

if not configs.c3_lsp then
    configs.c3_lsp = {
        default_config = {
            cmd = { "c3lsp" },
            filetypes = { "c3", "c3i" },
            root_dir = function(fname)
                return util.find_git_ancestor(fname)
            end,
            settings = {},
            name = "c3_lsp"
        }
    }
end
lspconfig.c3_lsp.setup {}

if not configs.serve_d then
    configs.serve_d = {
        default_config = {
            cmd = { "serve-d" },
            filetypes = { "d" },
            root_dir = function(fname)
                return util.find_git_ancestor(fname)
            end,
            settings = {},
            name = "serve_d"
        }
    }
end
lspconfig.serve_d.setup {}



require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'eslint', 'lua_ls', 'omnisharp', 'ts_ls', 'clangd', 'kotlin_language_server' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = lsp_capabilities,
            })
        end,
        kotlin_language_server = function()
            require("lspconfig").kotlin_language_server.setup({
                capabilities = lsp_capabilities,
                init_options = {
                    storagePath = "/home/chickencuber/.cache/nvim/kotlin"
                },
            })
        end,
        ts_ls = function()
            require('lspconfig').ts_ls.setup({
                capabilities = lsp_capabilities,
                root_dir = function()
                    -- Use the current working directory as the root directory
                    return vim.fn.getcwd()
                end,
            })
        end,
        clangd = function()
            require 'lspconfig'.clangd.setup {}
        end,
        omnisharp = function()
            require('lspconfig').omnisharp.setup({
                capabilities = lsp_capabilities,
                root_dir = function()
                    -- Use the current working directory as the root directory
                    return vim.fn.getcwd()
                end,
            })
        end,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                    }
                }
            })
        end,
        rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({
                capabilities = lsp_capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            })
        end,
    }
})


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


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
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
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

lsp.setup()
