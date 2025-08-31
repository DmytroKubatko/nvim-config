-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local set = vim.keymap.set

set('n', '<Esc>', '<cmd>nohlsearch<CR>')

set('i', 'jk', '<Esc>')

-- Diagnostic keymaps
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

set('n', '<leader>s', '<Cmd>w<CR>', { desc = 'Save current file' })
