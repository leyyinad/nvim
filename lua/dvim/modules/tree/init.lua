require("nvim-tree").setup {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 48,
    side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

vim.keymap.set(
  { "n", "v" }, "_", "<cmd>NvimTreeToggle<CR>", {
    noremap = true,
    desc = "Toggle file tree"
  }
)
