local dap = require("dap")

local mason_path = vim.fn.stdpath("data") .. "/mason/"
local adapter_path = mason_path .. "packages/php-debug-adapter/extension/out/phpDebug.js"

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { adapter_path }
}

dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006,
}


