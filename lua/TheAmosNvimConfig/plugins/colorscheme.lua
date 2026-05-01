return {
  -- Settign up colorscheme, if you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
  },

  {
    'catppuccin/nvim',
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
      transparent_background = true,
    },
    config = function(_, opts)
      -- Lazy does not load the opts if there is already a config for it, so you need to add the setup in config manually...
      require('catppuccin').setup(opts)
      -- vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },

  {
    'rose-pine/neovim',
    priority = 1000,
    name = 'rose-pine',
  },

  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
  },

  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = false,
  },

  {
    'loctvl842/monokai-pro.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('monokai-pro').setup()
    end,
  },

  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
  },
}
