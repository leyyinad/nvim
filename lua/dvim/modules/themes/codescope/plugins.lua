return {
	---@type LazySpec
  {
    "srt0/codescope.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local colors = require("codescope.palette").colors

      vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.blue })
    end,
  },
}
