local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  return
end

local file_symbols = {
  modified = "", -- Text to show when the file is modified.
  readonly = "", -- Text to show when the file is non-modifiable or readonly.
  unnamed = "󰇘", -- Text to show for unnamed buffers.
  newfile = "", -- Text to show for newly created file before first write
}

local UpdateTabNames = vim.api.nvim_create_augroup("UpdateTabNames", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter", "WinEnter" }, {
  group = UpdateTabNames,
  pattern = "*",
  callback = function()
    local function tabinfo(tabnr)
      local res = { nr = tabnr }
      res.win = vim.api.nvim_tabpage_get_win(tabnr)
      res.buf = vim.api.nvim_win_get_buf(res.win)
      res.buftype = vim.fn.getbufvar(res.buf, "&buftype")
      res.fullname = vim.api.nvim_buf_get_name(res.buf)
      res.shortname = vim.fn.fnamemodify(res.fullname, ":h:t") .. "/" .. vim.fn.fnamemodify(res.fullname, ":t")
      res.name = vim.fn.fnamemodify(res.fullname, ":t")
      return res
    end

    local tabs = vim.api.nvim_list_tabpages()
    for _, tabnr1 in ipairs(tabs) do
      local tab1 = tabinfo(tabnr1)
      local set = false
      for _, tabnr2 in ipairs(tabs) do
        local tab2 = tabinfo(tabnr2)
        if tab1.name == tab2.name and tab1.nr ~= tab2.nr and tab1.buftype == "" then
          vim.api.nvim_tabpage_set_var(tab1.nr, "tabname", tab1.shortname)
          set = true
        end
      end
      if not set then
        pcall(function()
          vim.api.nvim_tabpage_del_var(tab1.nr, "tabname")
        end)
      end
    end
  end,
})

local function quickfix_status()
  if vim.bo.buftype == "quickfix" then
    local qf = vim.fn.getqflist({ idx = 0, size = 0 })
    return string.format("  %d/%d", qf.idx, qf.size)
  end
  return ""
end

lualine.setup({
  options = {
    icons_enabled = true,
    section_separators = { left = "", right = "" },
    -- component_separators = { left = "", right = "" },
    -- section_separators = { },
    component_separators = {},
    globalstatus = false,
    always_divide_middle = false,
    disabled_filetypes = {
      "alpha",
      "man",
    },
    -- refresh = {
    -- 	-- statusline = 1000,
    -- 	-- tabline = 1000,
    -- 	-- winbar = 1000,
    -- 	-- refresh_time = 16, -- ~60fps
    -- 	events = {
    -- 		"WinEnter",
    -- 		"BufEnter",
    -- 		"BufWritePost",
    -- 		"SessionLoadPost",
    -- 		"FileChangedShellPost",
    -- 		"VimResized",
    -- 		"Filetype",
    -- 		"CursorMoved",
    -- 		"CursorMovedI",
    -- 		"ModeChanged",
    -- 		"TabEnter",
    -- 		"TabLeave",
    -- 		"TabNew",
    -- 		"TabNewEntered",
    -- 		"TabClosed",
    -- 	},
    -- },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "filetype",
        colored = true,
        icon_only = true,
        padding = { left = 1, right = 0 },
      },
      {
        "filename",
        path = 1,
        symbols = file_symbols,
        fmt = function(value)
          local p = vim.fn.fnamemodify(value, ":h")
          local n = vim.fn.fnamemodify(value, ":t")
          return "%#NonText#" .. p .. "/%#Normal#" .. n
        end,
      },
    },
    lualine_x = {
      {
        quickfix_status,
        color = 'lualine_x_insert'
      }
    },
    lualine_y = {
      "progress",
    },
    lualine_z = {
      "location",
      -- {
      -- 	"diagnostics",
      -- 	always_visible = false,
      -- },
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        "filename",
        path = 0,
        symbols = file_symbols,
        color = "TabLine",
      },
    },
    lualine_x = {
      {
        quickfix_status,
        color = 'lualine_x_inactive'
      }
    },
    lualine_y = {
      "location"
    },
  },
  tabline = {},
  extensions = {},
})
