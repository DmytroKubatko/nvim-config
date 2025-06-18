return {
  'numToStr/FTerm.nvim',
  config = function()
    local fterm = require 'FTerm'

    fterm.setup {}

    local map = vim.keymap.set

    map('n', '<leader>i', fterm.toggle, { desc = 'Toggle float terminal' })
    map('t', '<Esc>', '<C-\\><C-n>')
  end,
}
