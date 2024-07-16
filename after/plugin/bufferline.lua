require'bufferline'.setup{
    options = {
        numbers = "ordinal", -- Show buffer numbers as 1, 2, 3, etc.
        diagnostics = "nvim_lsp", -- Show diagnostics from LSP clients
        show_tab_indicators = true, -- Show tab indicators
        separator_style = "slant", -- Style of separator between buffers
        always_show_bufferline = true, -- Always show bufferline, even if there is only one buffer
    }
}

vim.keymap.set("n", "<tab>", function() vim.cmd("bn") end)

