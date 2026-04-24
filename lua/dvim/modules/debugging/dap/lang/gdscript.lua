local dap = require("dap")

dap.configurations.gdscript = {
  ---@type dap.Configuration
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  },
}
