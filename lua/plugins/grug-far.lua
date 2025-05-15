return {
  'MagicDuck/grug-far.nvim',
  config = function()
    local grug = require 'grug-far'
    grug.setup {
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>gf', function()
      grug.open()
    end, {
      desc = 'Find in project',
    })
  end,
}
