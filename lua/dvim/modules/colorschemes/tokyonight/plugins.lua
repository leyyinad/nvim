return {
  ---@type LazySpec
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      transparent = false,
    },
    config = function()
      vim.cmd "colorscheme tokyonight-night"
    end,
  },
}
