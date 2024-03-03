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
    end)
    vim.keymap.set("n", "<leader>he", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hj", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<leader>hk", function()
      harpoon:list():next()
    end)
  end,
}
