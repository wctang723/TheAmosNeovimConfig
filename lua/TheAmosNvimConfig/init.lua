require 'TheAmosNvimConfig.set'
require 'TheAmosNvimConfig.remap'
require 'TheAmosNvimConfig.lazy_init'

local augroup = vim.api.nvim_create_augroup
local TheAmosGroup = augroup('TheAmos', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightOnYank', {})

vim.cmd.colorscheme 'catppuccin-mocha'
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TroubleNormal', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'TroubleNormalNC', { link = 'Normal' })
-- vim.cmd 'highlight TelescopeSelection cterm=bold gui=bold guifg=#a6e3a1'

autocmd('TextYankPost', {
  group = yank_group,
  desc = 'Highlight when yanking text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end,
})

autocmd('VimLeave', {
  callback = function()
    vim.opt.guicursor = 'a:block-blinkwait700-blinkoff400-blinkon250'
  end,
})

autocmd('LspAttach', {
  group = TheAmosGroup,
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    --  To jump back, press <C-t>.
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('gtd', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('gds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('gws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  end,
})
