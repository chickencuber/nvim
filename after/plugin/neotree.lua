vim.keymap.set("n", "<leader>pv", function() vim.cmd("Neotree toggle") end)
require'neo-tree'.setup{
    filesystem = {
        hijack_netrw_behavior = 'open_current'
    }
}
if vim.bo.filetype == 'netrw' and vim.b.netrw_method == nil then
    vim.defer_fn(function()
        vim.cmd('enew | Neotree current dir=' .. vim.b.netrw_curdir)
    end, 0)
end
vim.cmd('Neotree position=current')
