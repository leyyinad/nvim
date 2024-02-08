vim.keymap.set(
  "n", "<leader>du",
  function()
    require('dapui').toggle()
  end,
  {
    noremap = true,
    desc = "Toggle DAP UI",
  }
  )

vim.keymap.set("n", "<leader>dc",
  function() require('dap').continue() end,
  { noremap = true, desc = "Start or resume debugging" })

vim.keymap.set("n", "<leader>dt",
  function() require('dap').terminate() end,
  { noremap = true, desc = "Terminate debugging" })

vim.keymap.set("n", "<leader>dl",
  function() require('dap').run_last() end,
  { noremap = true, desc = "Run last" })

vim.keymap.set("n", "<leader>dd",
  function() require('dap').repl.open() end,
  { noremap = true, desc = "REPL" })

-- debug_maps.d.b = {
--   name = "Breakpoint",
--   t = { ':lua require("dap").toggle_breakpoint()<CR>', "Toggle" },
--   c = { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "Set conditional" },
--   l = {
--     ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
--     "With Log Point Message",
--   },
-- }

vim.keymap.set("n", "<leader>db",
  function() require('dap').toggle_breakpoint() end,
  { noremap = true, desc = "Toggle breakpoint" })

vim.keymap.set("n", "<leader>di",
  function()
    require('dap.ui.widgets').hover(
      function() return vim.fn.expand("<cexpr>") end
    )
  end,
  { noremap = true, desc = "Inspect" })

vim.keymap.set("v", "<leader>di",
  function()
    require('dap.ui.widgets').visual_hover()
  end,
  { noremap = true, desc = "Inspect" })

vim.keymap.set("v", "<leader>d?",
  function()
    require('dap.ui.widgets').scopes()
  end,
  { noremap = true, desc = "Scopes" })

-- vim.keymap.set("n", "<leader>do",
vim.keymap.set("n", "<Space>l",
  function() require('dap').step_over() end,
  { noremap = true, desc = "Step over" })

-- vim.keymap.set("n", "<leader>dO",
vim.keymap.set("n", "<Space>k",
  function() require('dap').step_out() end,
  { noremap = true, desc = "Step out" })

-- vim.keymap.set("n", "<leader>di",
vim.keymap.set("n", "<Space>j",
  function() require('dap').step_into() end,
  { noremap = true, desc = "Step into" })

vim.keymap.set("n", "<Space>h",
  function() require('dap').step_back() end,
  { noremap = true, desc = "Step back" })

vim.keymap.set("n", "<Space>_",
  function() require('dap').run_to_cursor() end,
  { noremap = true, desc = "Run to cursor" })
