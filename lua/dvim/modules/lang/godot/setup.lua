local notify = require("notify")

vim.api.nvim_create_user_command("GodotTest", function()
  local project_root = vim.fs.root(0, { ".gutconfig.json", "project.godot" })

  if not project_root then
    notify("No project root found", "error")
    return
  end

  local gut_cli_path = project_root .. "/addons/gut/gut_cmdln.gd"

  if not vim.fn.filereadable(gut_cli_path) then
    notify("gut_cmdln.gd not found", "error")
    return
  end

  local cmd = {
    "godot",
    "-d",
    "-s",
    "--path",
    project_root,
    gut_cli_path,
  }

  notify("Running GUT tests...", "info")

  vim.system(cmd, {
    text = true,
    timeout = 30000,
  }, function(res)
    vim.schedule(function()
      if res.code == 0 then
        notify("Tests completed successfully", "info")
      else
        notify("Tests failed", "error")

        local buf = vim.api.nvim_create_buf(false, true)
        local chan = vim.api.nvim_open_term(buf, {})
        vim.api.nvim_chan_send(chan, res.stdout)
        vim.api.nvim_win_set_buf(0, buf)
      end
    end)
  end)
end, {})
