local builtin = require("telescope.builtin")
local telescope = require("telescope")

require("telescope-lsp-handlers").setup()
require("telescope").load_extension("dap")

vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true })

vim.keymap.set("n", "<leader>ff",
  builtin.find_files, { noremap = true, desc = "Find files" })
vim.keymap.set("n", "<leader>fg", 
  builtin.live_grep, { noremap = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true })

vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { noremap = true })
vim.keymap.set("n", "<leader>fs", builtin.lsp_dynamic_workspace_symbols, { noremap = true })

vim.keymap.set("n", "<leader>fn", telescope.extensions.notify.notify, { noremap = true })
