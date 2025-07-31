-- return {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd [[colorscheme tokyonight-night]]
--   end,
-- }
--
return {
  'one-dark/onedark.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require('onedark').setup()
  end,
}
