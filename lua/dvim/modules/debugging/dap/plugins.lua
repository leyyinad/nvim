return {
  ---@type LazySpec
  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
  },
  { "theHamsta/nvim-dap-virtual-text" },
  { "LiadOz/nvim-dap-repl-highlights" },
}
