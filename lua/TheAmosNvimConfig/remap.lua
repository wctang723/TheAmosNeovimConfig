vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '=ap', "mz=ap'z")

-- greatest remap ever
vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>mir', '<cmd>CellularAutomaton make_it_rain<CR>')
vim.keymap.set('n', '<leader>gol', '<cmd>CellularAutomaton game_of_life<CR>')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<C-n>', '<cmd>:bn<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>:bp<CR>')

vim.keymap.set('n', '<C-=>', '<C-w>+')
vim.keymap.set('n', '<C-->', '<C-w>-')
vim.keymap.set('n', '<C-,>', '<C-w><')
vim.keymap.set('n', '<C-.>', '<C-w>>')
