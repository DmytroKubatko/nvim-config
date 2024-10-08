return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    vim.keymap.set("n", "<leader>sb", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("x", "<leader>sb", substitute.visual, { desc = "Substitute in visual mode" })
    vim.keymap.set("n", "<leader>sbs", substitute.line, { desc = "Substitute line" })
    vim.keymap.set("n", "<leader>S", substitute.eol, { desc = "Substitute to end of line" })
  end,
}
