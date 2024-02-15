vim.g.mapleader=' '

vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'dd', '"_dd')
vim.keymap.set('n', 'p', '"0p')
vim.keymap.set('v', 'p', '"0p')

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree git_status<CR>')
vim.keymap.set('n', '<leader>t', ':Neotree focus<CR>')

-- BufferLine
vim.keymap.set('n', '<leader>]', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>[', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
