return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    local flash = require("flash")
    flash.setup({
      modes = {
        char = {
          enabled = false,
        },
      },
    })

    vim.keymap.set({ "n", "x", "o" }, "s", function()
      flash.jump()
    end, { desc = "Flash" })

    vim.keymap.set({ "n", "x", "o" }, "S", function()
      flash.treesitter()
    end, { desc = "Flash Treesitter" })

    vim.keymap.set("o", "r", function()
      flash.remote()
    end, { desc = "Flash Remote" })

    vim.keymap.set({ "o", "x" }, "R", function()
      flash.treesitter_search()
    end, { desc = "Treesitter Search" })

    vim.keymap.set("n", "<leader>sf", function()
      flash.toggle()
    end, { desc = "Toggle Flash Search" })
  end,
}
