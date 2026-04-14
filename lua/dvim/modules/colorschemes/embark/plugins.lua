return {
  ---@type LazySpec
  {
    "embark-theme/vim",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme embark"
    end,
  },
}
