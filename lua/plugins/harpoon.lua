return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    harpoon.setup()

    vim.keymap.set('n', '<leader>bm', function()
      harpoon:list():add()
    end, { desc = 'Add to Harpoon list' })

    vim.keymap.set('n', '<leader>bl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Show Harpoon list' })

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon: open file 1' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon: open file 2' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon: open file 3' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon: open file 4' })
  end,
}
