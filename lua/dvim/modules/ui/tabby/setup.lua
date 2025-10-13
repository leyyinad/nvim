local tabby = require("tabby")

local theme = {
  fill = "TabLineFill",
  head = "TabLine",
  current_tab = "StatusInsert",
  tab = "TabLine",
  win = "StatusNormal",
  tail = "TabLine",
}

local function lsp_diag()
  local icons = {
    error = "%#DiagnosticVirtualTextError#",
    warn = "%#DiagnosticVirtualTextWarn#",
    info = "%#DiagnosticVirtualTextInfo#",
    hint = "%#DiagnosticVirtualTextHint#󰋗",
  }
  local label = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      table.insert(label, { icon .. " " .. n .. " %##" })
    end
  end
  return label
end

tabby.setup({
  line = function(line)
    local current_tab_wins = line.wins_in_tab(line.api.get_current_tab())
    return {
      {
        { "  ", hl = "DiagnosticInfo" },
        line.sep("", theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        local win = tab.current_win()
        return {
          line.sep("", hl, theme.fill),
          win.file_icon(),
          win.buf_name(),
          win.buf().is_changed() and "" or "",
          line.sep("", hl, theme.fill),
          hl = hl,
          margin = " ",
        }
      end),
      line.spacer(),
      #current_tab_wins.wins > 1 and current_tab_wins.foreach(function(win)
        return {
          win.is_current() and line.sep("", theme.win, theme.fill) or " ",
          win.file_icon(),
          win.buf_name(),
          win.buf().is_changed() and "" or "",
          win.is_current() and line.sep("", theme.win, theme.fill) or " ",
          hl = win.is_current() and theme.win or theme.tab,
          margin = " ",
        }
      end) or "",
      lsp_diag(),
    }
  end,
  option = {},
})

vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", {
  desc = "Add tab",
  noremap = true,
})

vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", {
  desc = "Close tab",
  noremap = true,
})

vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", {
  desc = "Close other tabs",
  noremap = true,
})
