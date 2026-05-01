return {
    -- Settign up colorscheme, if you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    {
      'folke/tokyonight.nvim',
      enabled = false,
      priority = 1000, -- Make sure to load this before all the other start plugins.
      config = function()
        vim.cmd.colorscheme 'tokyonight-night'
        -- You can configure highlights by doing something like:
        -- vim.cmd.hi 'Comment gui=none'
      end,
    },

    { 
	'catppuccin/nvim',
	-- enabled = false,
	name = 'catppuccin', 
	priority = 1000,
	opts = {
	    flavour = 'mocha',
	    -- transparent_background = true,
	    no_italic = false,
	    color_overrides = {
		mocha = {
		    surface2 = '#494d64',
		    -- yellow = '#FFEDC6',
		    yellow = '#eeecbf',
		},
	    },
	    highlight_overrides = {
		mocha = function(mocha)
		    return {
			Comment = { fg = mocha.surface2 },
			Visual = { bg = mocha.yellow },
			IncSearch = { bg = mocha.rosewater },
			CurSearch = { bg = mocha.flamingo },
		    }
		end,
	    },
	},
	config = function(_, opts)
	    -- Lazy does not load the opts if there is already a config for it, so you need to add the setup in config manually...
	    require('catppuccin').setup(opts)
	    vim.cmd.colorscheme 'catppuccin-mocha'
	end,
    },

    {
	"rose-pine/neovim",
	enabled = false,
	priority = 1000,
	name = "rose-pine",
	config = function()
	    vim.cmd.colorscheme 'rose-pine'
	end,
    },

    {
	"rebelot/kanagawa.nvim",
	enabled = false,
	priority = 1000,
	config = function()
	    vim.cmd.colorscheme 'kanagawa-wave'
	end,
    },

    {
	"thesimonho/kanagawa-paper.nvim",
	enabled = false,
	lazy = false,
	priority = 1000,
	init = function()
	    vim.cmd.colorscheme 'kanagawa-paper-ink'
	end,
    },

    {
      "loctvl842/monokai-pro.nvim",
      enabled = false,
      lazy = false,
      priority = 1000,
      config = function()
	require("monokai-pro").setup()
	vim.cmd.colorscheme("monokai-pro-octagon")
      end,
    },

    {
	"EdenEast/nightfox.nvim",
	enabled = false,
	priority = 1000,
	config = function()
	    vim.cmd.colorscheme 'nightfox'
	end,
	
    }
}
