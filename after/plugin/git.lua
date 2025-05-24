local neogit = require('neogit')
vim.keymap.set("n", "<leader>gs", function ()
    local buf_path = vim.api.nvim_buf_get_name(0)
    local dir

    if buf_path == "" then
        dir = vim.loop.cwd()
    else
        dir = vim.fn.fnamemodify(buf_path, ":h")
    end

    local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --show-toplevel")[1]

    if not git_root or git_root == "" then
        git_root = vim.loop.cwd()
    end
    neogit.open({kind="split_above", cwd=git_root})
end)


