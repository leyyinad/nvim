require("snacks").setup({
  animate = { enabled = true },
  bigfile = { enabled = true },
  bufdelete = { enabled = true },
  dim = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = {
    enabled = true,
    layout = {
      cycle = true,
      preset = "dropdown",
      layout = {
        width = 0.9,
      },
    },
    matcher = {
      frecency = true,
    },
  },
  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  image = { enabled = true },
  dashboard = require("dvim.modules.bundles.snacks.dashboard"),
})
