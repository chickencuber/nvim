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
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
    use {'akinsho/nvim-bufferline.lua'}
end)