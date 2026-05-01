return {
    {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    -- optional but recommended
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
	    local actions = require("telescope.actions")
	    require('telescope').setup{
		defaults = {
		    mappings = {
			i = {
			    ["<C-u>"] = false,
			    ["<C-y>"] = actions.preview_scrolling_up,
			    ["<C-e>"] = actions.preview_scrolling_down,
			},
		    },
		},
	    }
	    -- NOTE: For the keymap setting for the telescope see ~/.config/nvim/after/plugin/telescope.lua
	    -- (It doesn't neccessary to put the keymap config in the 'after' directory,
	    -- you can put all the keymap setting under the config here just fine, I'm just playing (and learning!) with the neovim config structure
	    -- More info, see `:help rtp`)
	end,
    }
}
