local dap = require("dap")

dap.configurations.php = {
  ---@type dap.Configuration
  {
    -- log = true,
    type = "php",
    name = "Launch",
    request = "launch",
    program = "${file}",
    -- cwd = "${fileDirname}",
    port = 9003,
    -- stopOnEntry = false,
    stopOnEntry = true,
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
    --   }
    -- },
    runtimeArgs = {
      "-dxdebug.start_with_request=yes",
    },
    env = {
      XDEBUG_MODE = "debug",
      -- XDEBUG_MODE = "debug,develop",
      XDEBUG_CONFIG = "client_port=${port}",
    },
  },
}
