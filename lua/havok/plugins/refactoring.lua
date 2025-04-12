return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  config = function()
    local refactoring = require("refactoring")
    refactoring.setup()

    vim.keymap.set({ "x", "n" }, "<leader>rv", function()
      refactoring.debug.print_var()
    end, { desc = "Refactoring: Print var" })
  end,
}
