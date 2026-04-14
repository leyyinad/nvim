return {
  ---@type LazySpec
  {
    "bettervim/yugen.nvim",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme yugen"
    end,
  },
}
