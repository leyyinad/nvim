return {
  ---@type LazySpec
  {
    "nanotech/jellybeans.vim",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme jellybeans"
    end,
  },
}
