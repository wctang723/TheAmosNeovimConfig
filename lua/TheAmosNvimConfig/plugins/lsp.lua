return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'stevearc/conform.nvim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'j-hui/fidget.nvim',
    },
    config = function()
      require('conform').setup {
        formatters_by_ft = {},
      }

      local cmp_lsp = require 'cmp_nvim_lsp'
      local capabilities = vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

      require('fidget').setup {}
      require('mason').setup {}
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'gopls',
        },
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = capabilities
            require('lspconfig')[server_name].setup(server)
          end,

          ['lua_ls'] = function()
            local lspconfig = require 'lspconfig'

            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT',
                  },
                  diagnostics = {
                    globals = { 'vim' },
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                    checkThirdParty = false,
                  },
                  format = {
                    enable = true,
                    -- Put format options here
                    -- NOTE: the value should be STRING!!
                    defaultConfig = {
                      indent_style = 'space',
                      indent_size = '2',
                    },
                  },
                },
              },
            }
          end,
        },
      }
    end,
  },
}
