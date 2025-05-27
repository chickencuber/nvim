require("ibl").setup({
    scope = {
        enabled = false,
    }
})

require('mini.indentscope').setup({
    draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none()
    },
    symbol = "│", -- or whatever line char you like
})

