return {
  'lima1909/resty.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>rr', ':Resty run<CR>', mode = { 'n', 'v' }, desc = '[R]esty [R]un request under the cursor' },
    { '<leader>rv', ':Resty favorite<CR>', mode = { 'n', 'v' }, desc = '[R]esty [V]iew favorites' },
  },
}
