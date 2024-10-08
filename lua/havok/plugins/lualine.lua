return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    lualine.setup({
      options = {
        theme = "tokyonight",
      },
      sections = {
        lualine_x = {
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
