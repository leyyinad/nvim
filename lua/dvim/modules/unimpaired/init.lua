-- local keymaps = require("dvim.modules.unimpaired.keymaps")

require("unimpaired").setup {
  -- keymaps = keymaps
}

-- vim.keymap.set("", "<C-ü>", "<C-]>", {})
-- vim.keymap.set("n", "ü", "<C-]>", {})

vim.keymap.set("", "ö", "[", { remap = true });
vim.keymap.set("", "ä", "]", { remap = true });

vim.keymap.set({ "n", "v" }, "[p", "m`O<ESC>p``", {
  noremap = true,
  desc = "Paste above"
})

vim.keymap.set({ "n", "v" }, "]p", "m`o<ESC>p``", {
  noremap = true,
  desc = "Paste below"
})

