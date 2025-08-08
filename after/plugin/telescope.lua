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
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Fuzzy find buffers' })

