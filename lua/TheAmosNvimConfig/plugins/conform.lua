return {
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup {
        format_on_save = {
          timeout_ms = 5000,
          lsp_format = 'fallback',
        },
        formatters_by_ft = {
          c = { 'clang-format' },
          cpp = { 'clang-format' },
          lua = { 'stylua' },
          go = { 'gofmt' },
          sql = { 'pg_format' },
          -- javascript = { "prettier" },
          -- typescript = { "prettier" },
          -- elixir = { "mix" },
        },
        formatters = {
          ['clang-format'] = {
            prepend_args = { '-style=file', '-fallback-style=LLVM' },
          },
          ['pg_format'] = {
            prepend_args = { '--comma-break', '--no-extra-line' },
          },
        },
      }

      vim.keymap.set('n', '<leader>fo', function()
        require('conform').format { bufnr = 0 }
      end)
    end,
  },
}
