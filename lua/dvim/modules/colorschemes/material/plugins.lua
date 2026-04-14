return {
  ---@type LazySpec
  {
    "kaicataldo/material.vim",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme material"
    end,
  },
}
