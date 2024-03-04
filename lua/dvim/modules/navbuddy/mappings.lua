local navbuddy = require("nvim-navbuddy")

-- navbuddy.open()
vim.keymap.set(
  { "n", "v" }, "<leader>s",
  navbuddy.open,
  {
    noremap = true,
    desc = "Navbuddy",
  }
)
