return {
  ---@type LazySpec
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme onedark"
    end,
  },
}
