vim.api.nvim_set_keymap(
  'n',
  '<leader>55',
  ':lua require("jump-tag").jumpParent()<CR>',
  {
    noremap = true,
    silent = true,
    desc = "Jump to parent tag",
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>5n',
  ':lua require("jump-tag").jumpNextSibling()<CR>',
  {
    noremap = true,
    silent = true,
    desc = "Jump to next sibling",
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>5p',
  ':lua require("jump-tag").jumpPrevSibling()<CR>',
  {
    noremap = true,
    silent = true,
    desc = "Jump to prev sibling",
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>5c',
  ':lua require("jump-tag").jumpChild()<CR>',
  {
    noremap = true,
    silent = true,
    desc = "Jump to child",
  }
)
