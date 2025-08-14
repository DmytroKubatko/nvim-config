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
-- return {
--   'navarasu/onedark.nvim',
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('onedark').setup {
--       style = 'warmer',
--     }
--     -- Enable theme
--     require('onedark').load()
--   end,
-- }
--
return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      auto_integrations = true,
    }
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
