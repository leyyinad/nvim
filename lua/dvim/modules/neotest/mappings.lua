vim.keymap.set(
  "n", "<leader>ts",
  function()
    require("neotest").summary.open()
  end,
  {
    noremap = true,
    desc = "Show test summary"
  }
)

vim.keymap.set(
  "n", "<leader>tr",
  function()
    require("neotest").run.run()
  end,
  {
    noremap = true,
    desc = "Run test"
  }
)

vim.keymap.set(
  "n", "<leader>td",
  function()
    require("neotest").run.run({ strategy = "dap" })
  end,
  {
    noremap = true,
    desc = "Debug test"
  }
)

vim.keymap.set(
  "n", "<leader>tt",
  function()
    require("neotest").run.run_file()
  end,
  {
    noremap = true,
    desc = "Run test file"
  }
)

vim.keymap.set("n", "<leader>tl",
  function()
    require("neotest").run.run_last()
  end,
  {
    noremap = true,
    desc = "Run last test"
  }
)

vim.keymap.set(
  "n", "<leader>tL",
  function()
    require("neotest").run.run_last({ strategy = "dap " })
  end,
  {
    noremap = true,
    desc = "Debug last test"
  }
)
