local neotest = require('neotest')

vim.keymap.set("n", "<leader>ts", function()
  neotest.summary.open()
end, {
  noremap = true,
  desc = "Show test summary",
})

vim.keymap.set("n", "<leader>tr", function()
  neotest.run.run()
end, {
  noremap = true,
  desc = "Run test",
})

vim.keymap.set("n", "<leader>td", function()
  neotest.run.run({ strategy = "dap" })
end, {
  noremap = true,
  desc = "Debug test",
})

vim.keymap.set("n", "<leader>tt", function()
  neotest.run.run(vim.fn.expand("%"))
end, {
  noremap = true,
  desc = "Run test file",
})

vim.keymap.set("n", "<leader>tl", function()
  neotest.run.run_last()
end, {
  noremap = true,
  desc = "Run last test",
})

vim.keymap.set("n", "<leader>tL", function()
  neotest.run.run_last({ strategy = "dap " })
end, {
  noremap = true,
  desc = "Debug last test",
})
