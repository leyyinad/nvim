vim.keymap.set("", "<C-ü>", "<C-]>", {})
vim.keymap.set("n", "ü", "<C-]>", {})

-- TODO: prevent `:tabe %` scrolling to top, then remove <C-o> below
vim.keymap.set("n", "<C-t>ü", ":tabe %<CR><C-o><C-]>", {})

vim.keymap.set("v", "<", "<gv", { noremap = true, desc = "Unindent last selection" })
vim.keymap.set("v", ">", ">gv", { noremap = true, desc = "Indent last selection" })

vim.keymap.del("", "Y")

vim.keymap.set("", "ö", "[", { remap = true })
vim.keymap.set("", "ä", "]", { remap = true })

vim.keymap.set("", "öö", "[[", { remap = true })
vim.keymap.set("", "ää", "]]", { remap = true })

vim.keymap.set("", "öä", "[]", { remap = true })
vim.keymap.set("", "äö", "][", { remap = true })

vim.keymap.set("n", "<C-_><C-_>", "gcc", {
  remap = true,
  desc = "Comment/uncomment current line"
})

vim.keymap.set("v", "<C-_><C-_>", "gc", {
  remap = true,
  desc = "Comment/uncomment current selection"
})

vim.keymap.set("n", "<ESC><ESC>", "<Cmd>nohlsearch|diffupdate|normal!<CR>", {
  desc = "Reset highlights"
})

vim.keymap.set("n", "zS", vim.show_pos, {
  noremap = true,
  desc = "Show all the items at cursor position."
})

vim.keymap.set("n", "<leader>R", "<Cmd>restart<CR>", {
  noremap = true,
  desc = "Restart Neovim"
})
