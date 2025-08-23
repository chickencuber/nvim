local mocha = require("catppuccin.palettes").get_palette "mocha"

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
    highlights = require("catppuccin.groups.integrations.bufferline").get_theme {
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = mocha.crust },
                background = { fg = mocha.overlay1 },
            },
            mocha = {
                buffer_selected = { fg = mocha.text, bg = mocha.surface0, bold = true, italic = false },
                separator_selected = { fg = mocha.surface0, bg = mocha.surface0 },
                separator = { fg = mocha.crust, bg = mocha.crust },
                separator_visible = { fg = mocha.crust, bg = mocha.crust },
            },
        },
    },
}


vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLinePick)

