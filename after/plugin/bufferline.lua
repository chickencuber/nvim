require'bufferline'.setup{
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
        numbers = "ordinal", -- Show buffer numbers as 1, 2, 3, etc.
        diagnostics = "nvim_lsp", -- Show diagnostics from LSP clients
        show_tab_indicators = true, -- Show tab indicators
        separator_style = "slant", -- Style of separator between buffers
        always_show_bufferline = true, -- Always show bufferline, even if there is only one buffer
        offsets = {{filetype = "NvimTree", text = "File Explorer", padding = 1}},
    }
}


vim.keymap.set("n", "<tab>", vim.cmd.bn)
vim.keymap.set("n", "<leader>cb", vim.cmd.bd)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bp)
