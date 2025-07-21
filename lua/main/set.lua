vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.o.shell = "/usr/bin/fish"

vim.api.nvim_create_user_command('Lib', function(args)
    print(vim.fn.system("prmn lib " .. args.args))
end, {nargs = "?"})


vim.filetype.add({
    extension = {
        jspp="jspp",
        yuck = "yuck",
    },
})


local transparent = true

function ToggleTransparency()
    if transparent then
        vim.cmd.colorscheme "catppuccin-mocha"
    else
        vim.cmd [[ hi Normal guibg=NONE ]]
        vim.cmd [[ hi NormalNC guibg=NONE ]]
        vim.cmd [[ hi EndOfBuffer guibg=NONE ]]
    end
    transparent = not transparent
end

vim.api.nvim_set_keymap('n', '<leader>ut', ':lua ToggleTransparency()<CR>', { noremap = true, silent = true })

