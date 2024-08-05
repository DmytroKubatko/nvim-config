return {
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,
    config = function()
      local onedark = require("onedark")

      onedark.setup({
        style = "darker",
      })

      onedark.load()
    end,
  },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme catppuccin-mocha]])
  --
  --     require("catppuccin").setup({
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = true,
  --         treesitter = true,
  --         harpoon = true,
  --         lsp_saga = true,
  --         telescope = {
  --           enabled = true,
  --         },
  --       },
  --     })
  --   end,
  -- },
}
