local dap = require("dap")

dap.configurations.php = {
  {
    name = "Listen for Xdebug",
    type = "php",
    request = "launch",
    port = 9003,
    program = "${file}",
    runtimeExecutable = "php",
    -- log = true,
    -- stopOnEntry = false,
    -- xdebugSettings = {
    --   max_children = 512,
    --   max_data = 1024,
    --   max_depth = 4,
    -- },
    -- breakpoints = {
    --   exception = {
    --     Notice = false,
    --     Warning = false,
    --     Error = false,
    --     Exception = false,
    --     ["*"] = false,
    --   },
    -- },
  },
  {
    name = "run current script",
    type = "php",
    request = "launch",
    port = 9003,
    cwd = "${fileDirname}",
    program = "${file}",
    runtimeExecutable = "php",
  },
  {
    name = "listen address",
    type = "php",
    request = "launch",
    port = 9003,
  },
}
