return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup {
      mappings = {
        add = 'gra', -- Add surrounding in Normal and Visual modes
        delete = 'grd', -- Delete surrounding
        find = 'grf', -- Find surrounding (to the right)
        find_left = 'grF', -- Find surrounding (to the left)
        highlight = 'grh', -- Highlight surrounding
        replace = 'grr', -- Replace surrounding
        update_n_lines = 'grn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }
    require('mini.move').setup()
  end,
}
