local neotest_status_ok, neotest = pcall(require, "neotest")
if not neotest_status_ok then
  return
end

require("dvim.modules.neotest.mappings")
local adapters = require("dvim.modules.neotest.adapters")

neotest.setup {
  consumers = {
    overseer = require("neotest.consumers.overseer"),
  },
  adapters = adapters,
  quickfix = {
    enable = true,
    -- open = function()
    --   vim.cmd("Trouble quickfix")
    -- end,
  },
  icons = {
    expanded = "",
    child_prefix = "",
    child_indent = "",
    final_child_prefix = "",
    non_collapsible = "",
    collapsed = "",

    passed = "",
    running = "",
    failed = "",
    unknown = ""
  }
}
