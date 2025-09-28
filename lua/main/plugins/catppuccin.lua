return { "catppuccin/nvim", name = "catppuccin", priority = 1000, config=function()
    vim.cmd.colorscheme "catppuccin-mocha"
    require("catppuccin").setup({
        mason = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        lsp_trouble = true,
        lsp_saga = true,
        harpoon = true,
        cmp = true,
        neogit = true,
        gitsigns = true,
        ufo=true,
        noice = true,
    })
end}

