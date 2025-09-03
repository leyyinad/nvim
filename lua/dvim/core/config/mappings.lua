vim.keymap.set("", "<C-ü>", "<C-]>", {})
vim.keymap.set("n", "ü", "<C-]>", {})

-- TODO: prevent `:tabe %` scrolling to top, then remove <C-o> below
vim.keymap.set("n", "<C-t>ü", ":tabe %<CR><C-o><C-]>", {})

vim.keymap.set("v", "<", "<gv", { noremap = true, desc = "Unindent last selection" })
vim.keymap.set("v", ">", ">gv", { noremap = true, desc = "Indent last selection" })

vim.keymap.del("", "Y")

vim.keymap.set("", "ö", "[", { remap = true })
vim.keymap.set("", "ä", "]", { remap = true })

vim.keymap.set("", "<C-_><C-_>", "gcc", { remap = true })

vim.keymap.set("n", "<ESC><ESC>", "<Cmd>nohlsearch|diffupdate|normal!<CR>")
