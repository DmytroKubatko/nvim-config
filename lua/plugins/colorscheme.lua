return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd [[colorscheme tokyonight-moon]]
  end,
}
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
--
-- return {
--   'catppuccin/nvim',
--   lazy = false,
--   priority = 1000,
--   name = 'catppuccin',
--   config = function()
--     require('catppuccin').setup {
--       auto_integrations = true,
--     }
--     vim.cmd.colorscheme 'catppuccin-mocha'
--
--     -- nvim-tree higlights for git and diagnostics. Theme specific so should be loaded after theme set!
--     vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { link = 'DiffAdd' })
--     vim.api.nvim_set_hl(0, 'NvimTreeGitUntracked', { link = 'WarningMsg' })
--     vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { link = 'DiffDelete' })
--     vim.api.nvim_set_hl(0, 'NvimTreeGitRenamed', { link = 'DiffChange' })
--     vim.api.nvim_set_hl(0, 'NvimTreeGitUnmerged', { link = 'ErrorMsg' })
--   end,
-- }
--
-- return {
--   'luisiacc/gruvbox-baby',
--   lazy = false,
--   priority = 1000,
--   name = 'gruvbox',
--   config = function()
--     vim.cmd.colorscheme 'gruvbox-baby'
--   end,
-- }
