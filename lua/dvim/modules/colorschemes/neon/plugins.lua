return {
  ---@type LazySpec
  {
    "Zeioth/neon.nvim",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme neon"
    end,
  },
}
