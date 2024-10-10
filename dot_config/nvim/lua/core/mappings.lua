vim.g.mapleader=' '

vim.keymap.set('n', 'D', '"_d')
vim.keymap.set('n', 'dd', '"_dd')

-- NeoTree
vim.keymap.set('n', '<leader>o', ':Neotree git_status<CR>')
vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>')

-- BufferLine
vim.keymap.set('n', '<leader><Tab>', ':BufferLineCycleNext<CR>')
-- vim.keymap.set('n', '<leader>[', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
