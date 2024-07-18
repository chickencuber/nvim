vim.keymap.set("n", "<leader>pv", function() vim.cmd("Neotree toggle") end)

local neotree = require'neo-tree'

neotree.setup{
    filesystem = {
        hijack_netrw_behavior = 'open_current'
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function()
                neotree.close_all()
            end
        }
    }
}

if vim.bo.filetype == 'netrw' and vim.b.netrw_method == nil then
    vim.defer_fn(function()
        vim.cmd('enew | Neotree current dir=' .. vim.b.netrw_curdir)
    end, 0)
end

vim.cmd('Neotree position=current')

