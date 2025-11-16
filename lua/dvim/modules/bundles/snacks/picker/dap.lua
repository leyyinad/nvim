local dap_breakpoints = require('dap.breakpoints')

local M = {}

M.show_breakpoint_picker = function()
  local breakpoints = dap_breakpoints.get()

  local items = {}
  local cwd = vim.fn.getcwd()
  Snacks.picker.qflist()

  for bufnr, bps in pairs(breakpoints) do
    for _, bp in pairs(bps) do
      local file = vim.api.nvim_buf_get_name(bufnr)
      local fn_short = string.sub(file, #cwd + 2, -1)
      local row = bp.line
      local col = 1

      table.insert(items, {
        bufnr = bufnr,
        name = file,
        buf = bufnr,
        file = file,
        text = fn_short,
        row = row,
        pos = { row, col },
      })
    end
  end

  Snacks.picker({
    title = "DAP Breakpoints",
    items = items,
    preview = "file",
    format = function(item, _)
      return {
        { item.text,       "SnacksPickerLabel" },
        { ":" .. item.row, "SnacksPickerComment" }
      }
    end,
    confirm = function(picker, item)
      picker:close()
      vim.notify(item.buffer)
      vim.api.nvim_set_current_buf(item.bufnr)
      vim.api.nvim_win_set_cursor(0, { item.row, 1 })
    end,
  })
end

return M
