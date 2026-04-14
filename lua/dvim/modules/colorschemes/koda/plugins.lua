return {
  ---@type LazySpec
  {
    "oskarnurm/koda.nvim",
    priority = 1000,
    config = function()
      vim.cmd "colorscheme koda"
    end,
  },
}
