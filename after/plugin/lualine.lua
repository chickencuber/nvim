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
