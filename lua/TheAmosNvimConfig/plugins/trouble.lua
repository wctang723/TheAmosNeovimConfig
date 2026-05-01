return {
  {
    'folke/trouble.nvim',
    opts = {
      focus = true,
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle <cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle <cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>td',
        '<cmd>Trouble todo filter = {tag = {TODO,FIX}}<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
