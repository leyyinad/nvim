local dap = require("dap")

dap.configurations.php = {
  {
    type = "php",
    name = "Launch",
    request = "launch",
    program = "${file}",
    -- cwd = "${fileDirname}",
    port = 9003,
    runtimeArgs = {
      "-dxdebug.start_with_request=yes",
    },
    env = {
      XDEBUG_MODE = "debug,develop",
      XDEBUG_CONFIG = "client_port=${port}",
    },
  },
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
  },
}
