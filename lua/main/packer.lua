-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { "catppuccin/nvim", as = "catppuccin",config= function()
		vim.cmd.colorscheme "catppuccin-mocha"
	end
	}
	require("catppuccin").setup({
		mason = true
	})
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {'VonHeikemen/lsp-zero.nvim',
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    }
    use {'akinsho/nvim-bufferline.lua'}
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use {
        'adelarsq/image_preview.nvim',
        config = function()
            require("image_preview").setup({})
        end
    }
end)
