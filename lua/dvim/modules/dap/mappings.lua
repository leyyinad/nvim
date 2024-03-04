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

vim.keymap.set(
  "n", "<leader>dc",
  function()
    require('dap').continue()
  end,
  {
    noremap = true,
    desc = "Start or resume debugging",
  }
)

vim.keymap.set(
  "n", "<leader>dt",
  function()
    require('dap').terminate()
  end,
  {
    noremap = true,
    desc = "Terminate debugging",
  }
)

vim.keymap.set(
  "n", "<leader>dl",
  function()
    require('dap').run_last()
  end,
  {
    noremap = true,
    desc = "Run last",
  }
)

vim.keymap.set("n", "<leader>dr",
  function() require('dap').repl.open() end,
  { noremap = true, desc = "REPL" })

-- debug_maps.d.b = {
--   name = "Breakpoint",
--   c = { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "Set conditional" },
--   l = {
--     ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
--     "With Log Point Message",
--   },
-- }

vim.keymap.set(
  "n", "<leader>b",
  function()
    require('dap').toggle_breakpoint()
  end,
  {
    noremap = true,
    desc = "Toggle breakpoint",
  }
)

--   c = { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "Set conditional" },
vim.keymap.set(
  "n", "<leader>B",
  function()
    require('dap').set_breakpoint(vim.ui.input("Breakpoint condition: "))
  end,
  {
    noremap = true,
    desc = "Set conditional breakpoint",
  }
)

vim.keymap.set(
  "n", "<Leader>lp",
  function()
    require("dap").set_breakpoint(nil, nil, vim.ui.input("Log point message: "))
  end,
  {
    noremap = true,
    desc = "Set log breakpoint",
  }
)

vim.keymap.set(
  { "n", "v" }, "<leader>dh",
  function()
    require('dap.ui.widgets').hover()
  end,
  {
    noremap = true,
    desc = "Hover",
  }
)

vim.keymap.set(
  { "n", "v" }, "<leader>dp",
  function()
    require('dap.ui.widgets').preview()
  end,
  {
    noremap = true,
    desc = "Hover",
  }
)

vim.keymap.set(
  "n", "<leader>dd",
  function()
    require('dap').focus_frame()
  end,
  {
    noremap = true,
    desc = "Jump to current frame",
  }
)

vim.keymap.set(
  "n", "<leader>df",
  function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames).open()
    -- widgets.sidebar(widgets.frames).open()
  end,
  {
    noremap = true,
    desc = "Show frames",
  }
)

vim.keymap.set(
  "n", "<leader>ds",
  function()
    local widgets = require('dap.ui.widgets')
    -- widgets.centered_float(widgets.scopes).open()
    widgets.sidebar(widgets.scopes).open()
  end,
  {
    noremap = true,
    desc = "Show Scopes",
  }
)

vim.keymap.set("n", "<Space>l",
  function() require('dap').step_over() end,
  { noremap = true, desc = "Step over" })

vim.keymap.set("n", "<Space>k",
  function() require('dap').step_out() end,
  { noremap = true, desc = "Step out" })

vim.keymap.set("n", "<Space>j",
  function() require('dap').step_into() end,
  { noremap = true, desc = "Step into" })

vim.keymap.set("n", "<Space>h",
  function() require('dap').step_back() end,
  { noremap = true, desc = "Step back" })

vim.keymap.set("n", "<Space>_",
  function() require('dap').run_to_cursor() end,
  { noremap = true, desc = "Run to cursor" })
