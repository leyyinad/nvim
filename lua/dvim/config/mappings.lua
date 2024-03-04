vim.keymap.set("", "<C-ü>", "<C-]>", {})
vim.keymap.set("n", "ü", "<C-]>", {})

vim.keymap.set("v", "<", "<gv", { noremap = true, desc = "Unindent last selection" })
vim.keymap.set("v", ">", ">gv", { noremap = true , desc = "Indent last selection"})

vim.keymap.del("", "Y")

