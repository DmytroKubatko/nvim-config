return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    vim.keymap.set("n", "sb", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("x", "sb", substitute.visual, { desc = "Substitute in visual mode" })
    vim.keymap.set("n", "sbs", substitute.line, { desc = "Substitute line" })
    vim.keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
  end,
}
