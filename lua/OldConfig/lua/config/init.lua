require('config.lazy')

vim.lsp.enable('gopls')
vim.lsp.config('gopls', {cmd = {'/Users/amos/go/bin/gopls'}, })
