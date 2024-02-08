local keymaps = require("dvim.modules.unimpaired.keymaps")

require("unimpaired").setup {
  keymaps = keymaps
}

-- vim.keymap.set("", "<C-ü>", "<C-]>", {})
-- vim.keymap.set("n", "ü", "<C-]>", {})

vim.keymap.set("", "ö", "[");
vim.keymap.set("", "ä", "]");
