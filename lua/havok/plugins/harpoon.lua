return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup()

    vim.keymap.set("n", "<leader>hm", function()
      harpoon:list():append()
    end, { desc = "Add to Harpoon list" })

    vim.keymap.set("n", "<leader>he", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Show Harpoon list" })

    vim.keymap.set("n", "<M-1>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<M-2>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<M-3>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<M-4>", function()
      harpoon:list():select(4)
    end)
  end,
}
