-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = { style = "moon" },
--   config = function()
--     vim.cmd([[colorscheme tokyonight]])
--   end,
-- }

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme kanagawa]])
  end,
}
