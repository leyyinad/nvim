local current_file = debug.getinfo(1, "S").source:sub(2)
local current_dir = vim.fn.fnamemodify(current_file, ":h")
local logo_file = current_dir .. "/dh-logo.svg"

vim.api.nvim_create_autocmd("BufDelete", {
  group = vim.api.nvim_create_augroup("bufdelpost_autocmd", {}),
  desc = "BufDeletePost User autocmd",
  callback = function ()
    vim.schedule(function ()
      vim.api.nvim_exec_autocmds("User", {
        pattern = "BufDeletePost"
      })
    end)
  end
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BufDeletePost",
  group = vim.api.nvim_create_augroup("dashboard_delete_buffers", {}),
  desc = "Open Dashboard when no available buffers",
  callback = function (ev)
    local deleted_name = vim.api.nvim_buf_get_name(ev.buf)
    local deleted_ft = vim.api.nvim_get_option_value("filetype", { buf = ev.buf })
    local deleted_bt = vim.api.nvim_get_option_value("buftype", { buf = ev.buf })
    local dashboard_on_empty = deleted_name == "" and deleted_ft == "" and deleted_bt == ""

    if dashboard_on_empty then
      -- vim.cmd("Dashboard")
      Snacks.dashboard.open()
    end
  end
})

return {
  preset = {
    header = "READY.",
    keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      {
        icon = " ",
        key = "c",
        desc = "Config",
        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"
      },
      -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = "󱁤 ", key = "m", desc = "Mason", action = ":Mason", enabled = package.loaded.mason ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" }
    }
  },
  sections = {
    {
      section = "terminal",
      cmd = "chafa " .. logo_file .. " --format symbols --symbols all --size 32x8 --align center ; sleep .1",
      ttl = 5 * 60,
      height = 10
    },
    {
      section = "keys"
    }
  }
}
