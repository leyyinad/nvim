require("notify").setup {
  fps = 60,
  render = "wrapped-compact",
  stages = "slide",
  timeout = 2000,
  top_down = false,

  max_height = function()
    return math.floor(vim.o.lines * 0.5)
  end,

  max_width = function()
    return math.floor(vim.o.columns * 0.5)
  end,
}
