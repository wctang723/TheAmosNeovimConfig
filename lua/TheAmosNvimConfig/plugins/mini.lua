return {
  {
    -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
      -- Better Around/Inside textobjects
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      --  `:h MiniAi-builtin-textobjects`
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup { highlight_duration = 1000, n_lines = 500, search_method = 'cover' }

      -- For auto pairing
      require('mini.pairs').setup()

      -- Simple statusline.
      require('mini.statusline').setup()

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
