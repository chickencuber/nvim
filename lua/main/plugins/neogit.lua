return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    config=function()
        local neogit = require('neogit')
        vim.keymap.set("n", "<leader>gs", function ()
            local buf_path = vim.api.nvim_buf_get_name(0)
            local dir

            if buf_path == "" then
                dir = vim.loop.cwd()
            else
                dir = vim.fn.fnamemodify(buf_path, ":h")
            end
            if dir == nil then
                dir = ""
            end
            local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --show-toplevel")[1]

            if not git_root or git_root == "" then
                local set = vim.loop.cwd();
                if set == nil then
                    set = ""
                end
                git_root = set
            end
            neogit.open({kind="split_above", cwd=git_root})
        end)
    end
}
