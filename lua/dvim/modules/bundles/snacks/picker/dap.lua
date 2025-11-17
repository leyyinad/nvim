local dap_breakpoints = require('dap.breakpoints')

local M = {}

local function collect_breakpoints(_, _)
  local items = {}
  for buf, breakpoints in pairs(dap_breakpoints.get()) do
    local file = vim.api.nvim_buf_get_name(buf)
    for _, breakpoint in pairs(breakpoints) do
      table.insert(items, {
        file = file,
        buf = buf,
        pos = { breakpoint.line, 1 }
      })
    end
  end
  return items
end

local function format(item, ctx)
  local file = vim.api.nvim_buf_get_name(item.buf)
  local cwd = ctx:cwd()
  local filename = string.sub(file, #cwd + 2, -1)

  return {
    { filename,           "SnacksPickerLabel" },
    { ":" .. item.pos[1], "SnacksPickerComment" }
  }
end

local function remove_breakpoint(picker)
  local items = picker:selected({ fallback = true })
  for _, item in ipairs(items) do
    dap_breakpoints.remove(item.buf, item.pos[1])
  end
  picker:refresh()
end

local function toggle_breakpoint(picker)
  local items = picker:selected({ fallback = true })
  for _, item in ipairs(items) do
    dap_breakpoints.toggle({}, item.buf, item.pos[1])
  end
end

M.show_breakpoint_picker = function()
  Snacks.picker({
    title = "DAP Breakpoints",
    finder = collect_breakpoints,
    preview = "file",
    format = format,
    actions = {
      remove_breakpoint = remove_breakpoint,
      toggle_breakpoint = toggle_breakpoint,
    },
    win = {
      input = {
        keys = {
          ["<C-x>"] = {
            "remove_breakpoint",
            mode = { "n", "i" },
            desc = "Remove breakpoint"
          },
          ["<C-d>"] = {
            "toggle_breakpoint",
            mode = { "n", "i" },
            desc = "Toggle breakpoint"
          },
        }
      },
    },
  })
end

return M
