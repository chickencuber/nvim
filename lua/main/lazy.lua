local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",  -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config=function()
            local builtin = require('telescope.builtin')

            require('telescope').setup{
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case'
                    },
                }
            }

            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', "<leader>pc", function ()
                vim.cmd("Telescope buffers")
            end)
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({search = vim.fn.input("Grep > ")})
            end)
            vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Fuzzy find buffers' })
        end
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, config=function()
        vim.cmd.colorscheme "catppuccin-mocha"
        require("catppuccin").setup({
            mason = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
            lsp_trouble = true,
            lsp_saga = true,
            harpoon = true,
            cmp = true,
            neogit = true,
            gitsigns = true,
            ufo=true,
            noice = true,
        })
    end},
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate", config=function()
        vim.filetype.add({
            extension = {
                c3 = "c3",
                c3i = "c3",
                c3t = "c3",
                by = "bython",
            },
        })

        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.c3 = {
            install_info = {
                url = "https://github.com/c3lang/tree-sitter-c3",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "main",
            },
        }

        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "javascript", "typescript" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
            parser_install_info = {
                c3 = {
                    install_info = {
                        url = "https://github.com/c3lang/tree-sitter-c3",
                        files = { "src/parser.c", "src/scanner.c" },
                        branch = "main",
                    },
                    sync_install = false, -- Set to true if you want to install synchronously
                    auto_install = true,  -- Automatically install when opening a file
                    filetype = "c3",      -- if filetype does not match the parser name
                },
            },

            -- List of parsers to ignore installing (or "all")

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }

        vim.treesitter.language.register('python', 'bython')
    end},
    {'nvim-treesitter/nvim-treesitter-context'},
    {'nvim-treesitter/nvim-treesitter-refactor'},
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config=function()
            local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        end
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config=function()
            local neogit = require('neogit')
            vim.keymap.set("n", "<leader>gs", function ()
                local buf_path = vim.api.nvim_buf_get_name(0)
                local dir

                if buf_path == "" then
                    dir = vim.loop.cwd()
                else
                    dir = vim.fn.fnamemodify(buf_path, ":h")
                end
                if dir == nil then
                    dir = ""
                end
                local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --show-toplevel")[1]

                if not git_root or git_root == "" then
                    local set = vim.loop.cwd();
                    if set == nil then
                        set = ""
                    end
                    git_root = set
                end
                neogit.open({kind="split_above", cwd=git_root})
            end)
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config=function()
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

            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            vim.lsp.config("c3_lsp", {
                cmd = { "c3lsp" },
                filetypes = { "c3", "c3i" },
                root_markers={".git"}
            })
            vim.lsp.enable("c3_lsp");

            vim.lsp.config("serve_d", {
                cmd = { "serve-d" },
                filetypes = { "d" },
                root_markers={".git"}
            })


            vim.lsp.config("kotlin_language_server", {})

            vim.lsp.config("ts_ls",{})
            vim.lsp.config("omnisharp", {})
            vim.lsp.config("clangd", {})

            vim.lsp.config("rust_analyzer", {})
            require('mason-lspconfig').setup({
                ensure_installed = { 'rust_analyzer', 'eslint', 'lua_ls', 'omnisharp', 'ts_ls', 'clangd', 'kotlin_language_server'},
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
                end
            },
            {
                'windwp/nvim-autopairs',
                event = "InsertEnter",
                config = true
            },
            {
                "nvim-tree/nvim-tree.lua",
                version = "*",
                lazy = false,
                dependencies = {
                    "nvim-tree/nvim-web-devicons",
                },
                config = function()
                    vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
                    print(vim.keymap.set)
                    vim.g.loaded_netrw = 1
                    vim.g.loaded_netrwPlugin = 1

                    -- optionally enable 24-bit colour
                    vim.opt.termguicolors = true

                    -- empty setup using defaults
                    require("nvim-tree").setup({
                        hijack_unnamed_buffer_when_opening = true,
                        sort = {
                            sorter = "case_sensitive",
                        },
                        view = {
                            width = 30,
                        },
                        renderer = {
                            group_empty = true,
                        },
                        filters = {
                            dotfiles = true,
                        },
                    })

                    vim.api.nvim_create_autocmd("BufEnter", {
                        callback = function(args)
                            local buf_type = vim.bo[args.buf].buftype
                            local buf_name = vim.api.nvim_buf_get_name(args.buf)
                            if(buf_type == "terminal") then
                                vim.cmd('NvimTreeClose')
                                return
                            end

                            -- Ensure we are not in a terminal buffer or a modified buffer
                            if buf_type == '' and buf_name ~= 'NvimTree' then
                                vim.cmd('NvimTreeClose')
                            end
                            if buf_name == "" and buf_type == '' and not vim.bo[args.buf].modified then
                                -- Delay the execution to ensure it's done in a proper context
                                vim.defer_fn(function()
                                    if vim.fn.bufname() == "" then
                                        vim.cmd('NvimTreeOpen')
                                    end
                                end, 50)
                            end
                        end,
                    })
                end,
            },
            {
                'ron-rs/ron.vim'
            },
            {
                'NvChad/nvim-colorizer.lua',
                config = function()
                    require("colorizer").setup {
                        filetypes = { "*" },
                        user_default_options = {
                            RGB = true,           -- #RGB hex codes
                            RRGGBB = true,        -- #RRGGBB hex codes
                            names = true,         -- "Name" codes like Blue or blue
                            RRGGBBAA = false,     -- #RRGGBBAA hex codes
                            AARRGGBB = false,     -- 0xAARRGGBB hex codes
                            rgb_fn = false,       -- CSS rgb() and rgba() functions
                            hsl_fn = false,       -- CSS hsl() and hsla() functions
                            css = false,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                            css_fn = false,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
                            -- Available modes for `mode`: foreground, background,  virtualtext
                            mode = "virtualtext", -- Set the display mode.
                            -- Available methods are false / true / "normal" / "lsp" / "both"
                            -- True is same as normal
                            tailwind = false,                                -- Enable tailwind colors
                            -- parsers can contain values used in |user_default_options|
                            sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
                            virtualtext = "■",
                            -- update color values even if buffer is not focused
                            -- example use: cmp_menu, cmp_docs
                            always_update = false
                        },
                        -- all the sub-options of filetypes apply to buftypes
                        buftypes = {},
                    }
                end },
                {
                    'nvim-lualine/lualine.nvim',
                    dependencies = { 'nvim-tree/nvim-web-devicons' },
                    config=function()
                        require('lualine').setup{
                            -- options = { section_separators = '', component_separators = '' },
                            sections = {
                                lualine_a = {'mode'},
                                lualine_b = {'branch', 'diff', 'diagnostics'},
                                lualine_c = {},
                                lualine_x = {},
                                lualine_y = {"filetype"},
                                lualine_z = {'progress'}
                            },
                        }
                    end
                },
                {
                    "lukas-reineke/indent-blankline.nvim",
                    dependencies={
                        "echasnovski/mini.indentscope",
                    },
                    main = "ibl",
                    config=function()
                        require("ibl").setup({
                            scope = {
                                enabled = false,
                            }
                        })

                        require('mini.indentscope').setup({
                            draw = {
                                delay = 0,
                                animation = require('mini.indentscope').gen_animation.none()
                            },
                            symbol = "│", -- or whatever line char you like
                        })
                    end
                },
                {
                    "wstucco/c3.nvim",
                    config = function()
                        require("c3")
                    end,
                },
                { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', config=function()
                    require('ufo').setup({
                        open_fold_hl_timeout = 150,
                        provider_selector = function()
                            return {'treesitter', 'indent'}
                        end
                    })

                    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
                    vim.o.foldcolumn = '0'
                    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
                    vim.o.foldlevelstart = 99
                    vim.o.foldenable = true

                    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
                    vim.keymap.set('n', 'to', require('ufo').openAllFolds)
                    vim.keymap.set('n', 'tp', require('ufo').closeAllFolds)
                    vim.keymap.set('n', "tt", "za", { noremap = true, silent = true })
                end},
                {
                    "windwp/nvim-ts-autotag",
                    config=function()
                        require('nvim-ts-autotag').setup()
                    end
                },
                {
                    'MeanderingProgrammer/render-markdown.nvim',
                    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
                    config=function()
                        require('render-markdown').setup({})
                    end
                },
                {
                    'nvim-orgmode/orgmode',
                    event = 'VeryLazy',
                    ft = { 'org' },
                    config = function()
                        require('orgmode').setup({
                            org_agenda_files = '~/orgfiles/**/*',
                            org_default_notes_file = '~/orgfiles/refile.org',
                            org_startup_folded = "inherit",
                            mappings = {
                                org = {
                                    org_cycle=false,
                                    org_global_cycle=false,
                                    org_toggle_checkbox="<leader>tt"
                                },
                            },
                        })
                    end,
                },
                {
                    "chickencuber/toggle-checkbox.nvim",
                    config = function()
                        require("toggle-checkbox").setup({
                            char = "X",
                        })
                    end,
                },
                {
                    "chipsenkbeil/org-roam.nvim",
                    tag = "0.2.0",
                    dependencies = {
                        {
                            "nvim-orgmode/orgmode",
                            tag = "0.7.0",
                        },
                    },
                    config = function()
                        require("org-roam").setup({
                            directory = "~/orgfiles",
                        })
                    end
                },
                {
                    'akinsho/org-bullets.nvim',
                    config = function()
                        require('org-bullets').setup()
                    end
                },
                {
                    "chickencuber/PicVim",
                    config = function()
                        require'picvim'.setup()
                    end,
                },
                {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', config=function()
                    require("bufferline").setup {
                        options = {
                            mode = "buffers",
                            numbers = "none",
                            separator_style = "slant", -- "slant", "padded_slant", "thick", or "thin"
                            always_show_bufferline = true,
                            show_buffer_close_icons = false,
                            show_close_icon = false,
                            color_icons = true,
                            diagnostics = "nvim_lsp",
                            diagnostics_indicator = function(count, level)
                                local icon = level:match("error") and " " or " "
                                return " " .. icon .. count
                            end,
                            offsets = {
                                {
                                    filetype = "NvimTree",
                                    text = "File Explorer",
                                    text_align = "center",
                                    highlight = "Directory",
                                    separator = true,
                                },
                            },
                        },
                        highlights = require("catppuccin.special.bufferline").get_theme()
                    }


                    vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext)
                    vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev)
                    vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLinePick)
                end},
                {
                    "Djancyp/better-comments.nvim",
                    config = function()
                        require('better-comment').Setup()
                    end
                },
                -- lazy.nvim
                {
                    "folke/noice.nvim",
                    event = "VeryLazy",
                    dependencies = {
                        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                        "MunifTanjim/nui.nvim",
                    },
                    config=function()
                        require("noice").setup({
                            presets = {
                                command_palette = true, -- position the cmdline and popupmenu together
                            },
                        })
                    end
                }
            })
