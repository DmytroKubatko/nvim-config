return {
  'm-demare/attempt.nvim',
  config = function()
    local attempt = require 'attempt'
    attempt.setup()

    local map = vim.keymap.set

    map('n', '<leader>an', attempt.new_select, { desc = 'new attempt, selecting extension' })
    map('n', '<leader>ai', attempt.new_input_ext, { desc = 'new attempt, inputing extension' })
    map('n', '<leader>ar', attempt.run, { desc = 'run attempt' })
    map('n', '<leader>ad', attempt.delete_buf, { desc = 'delete attempt from current buffer' })
    map('n', '<leader>ac', attempt.rename_buf, { desc = 'rename attempt from current buffer' })
    map('n', '<leader>al', attempt.open_select, { desc = 'search through attempts' })
  end,
}
