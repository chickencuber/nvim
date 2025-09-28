return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false, build = ":TSUpdate",
    dependencies={
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/nvim-treesitter-refactor',
        'ron-rs/ron.vim'
    },
    config=function()
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
    end
}
