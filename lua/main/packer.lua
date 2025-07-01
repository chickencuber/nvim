-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "catppuccin/nvim", as = "catppuccin", config = function()
        vim.cmd.colorscheme "catppuccin-mocha"
    end
    }
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
        bufferline = true,
    })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/nvim-treesitter-refactor')
    use({
        'theprimeagen/harpoon',
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    })
    use('mbbill/undotree')
    -- use('tpope/vim-fugitive')
    use { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim', "sindrets/diffview.nvim" } }

    use { 'VonHeikemen/lsp-zero.nvim',
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },

        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
    }
    use { 'akinsho/nvim-bufferline.lua' }
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use 'ron-rs/ron.vim'
    use {
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
        end }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }
    use "lukas-reineke/indent-blankline.nvim"
    use "echasnovski/mini.indentscope"
    use {
        "Djancyp/better-comments.nvim",
        config = function()
            require('better-comment').Setup()
        end
    }
    use "HiPhish/rainbow-delimiters.nvim"
    use {
        "wstucco/c3.nvim",
        config = function()
            require("c3")
        end,
    }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use "windwp/nvim-ts-autotag"
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        config = function()
            require('render-markdown').setup({})
        end,
    })
    use {
        'nvim-orgmode/orgmode',
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
        end
    }

    use {
        "chickencuber/toggle-checkbox.nvim",
        config = function()
            require("toggle-checkbox").setup({
                char = "X",
            })
        end,
    }
    use {
        "chipsenkbeil/org-roam.nvim",
        tag = "0.1.1",
        requires = {
            {
                "nvim-orgmode/orgmode",
                tag = "0.3.7",
            },
        },
        config = function()
            require("org-roam").setup({
                directory = "~/orgfiles",
            })
        end
    }
    use {
        'akinsho/org-bullets.nvim',
        config = function()
            require('org-bullets').setup()
        end
    }
    use {
        "jake-stewart/multicursor.nvim",
        config = function()
            local mc = require('multicursor-nvim')
            mc.setup()

            local set = vim.keymap.set

            -- Add or skip cursor above/below the main cursor.
            set({"n", "x"}, "<up>", function() mc.lineAddCursor(-1) end)
            set({"n", "x"}, "<down>", function() mc.lineAddCursor(1) end)
            set({"n", "x"}, "<leader><up>", function() mc.lineSkipCursor(-1) end)
            set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end)

            -- Add or skip adding a new cursor by matching word/selection
            set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end)
            set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end)
            set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end)
            set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end)

            -- Add and remove cursors with control + left click.
            set("n", "<c-leftmouse>", mc.handleMouse)
            set("n", "<c-leftdrag>", mc.handleMouseDrag)
            set("n", "<c-leftrelease>", mc.handleMouseRelease)

            -- Disable and enable cursors.
            set({"n", "x"}, "<c-q>", mc.toggleCursor)

            -- Mappings defined in a keymap layer only apply when there are
            -- multiple cursors. This lets you have overlapping mappings.
            mc.addKeymapLayer(function(layerSet)

                -- Select a different cursor as the main one.
                layerSet({"n", "x"}, "<left>", mc.prevCursor)
                layerSet({"n", "x"}, "<right>", mc.nextCursor)

                -- Delete the main cursor.
                layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

                -- Enable and clear cursors using escape.
                layerSet("n", "<esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
            end)

            -- Customize how cursors look.
            local hl = vim.api.nvim_set_hl
            hl(0, "MultiCursorCursor", { reverse = true })
            hl(0, "MultiCursorVisual", { link = "Visual" })
            hl(0, "MultiCursorSign", { link = "SignColumn"})
            hl(0, "MultiCursorMatchPreview", { link = "Search" })
            hl(0, "MultiCursorDisabledCursor", { reverse = true })
            hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
            hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
        end
    }
    use {
        "chickencuber/PicVim",
        config = function()
            require'picvim'.setup()
        end,
    }
end)
