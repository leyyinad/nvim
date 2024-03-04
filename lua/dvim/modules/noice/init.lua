local noice_status_ok, noice = pcall(require, "noice")
if not noice_status_ok then
  return
end

noice.setup {
  cmdline = {
    enabled = true,
    -- view = "cmdline",
    view = "cmdline_popup",
    format = {
      cmdline = { pattern = "^:", icon = "" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
      help = { pattern = "^:%s*h%s+", icon = "󰋖" },
      calculator = { pattern = "^:=", icon = "󰃬", lang = "vimnormal" },
      input = {},
    },
  },
  messages = {
    enabled = true,
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
    view_history = "split",
    view_search = false,
  },
  popupmenu = {
    enabled = true,
    backend = "mini",
    kind_icons = {},
  },
  -- redirect = {},
  commands = {
    history = {
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
    },
    last = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
      filter_opts = { count = 1 },
    },
    errors = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = { error = true },
      filter_opts = { reverse = true },
    },
  },
  notify = {
    enabled = false,
    view = "notify",
  },
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 1000 / 30,
      view = "mini",
    },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
    hover = {
      enabled = true,
      view = nil,
      opts = {},
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 50,
      },
      view = nil,
      opts = {},
    },
    message = {
      enabled = true,
      view = "notify",
      opts = {},
    },
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help,
      ["%[.-%]%((%S-)%)"] = require("noice.util").open,
    },
    highlights = {
      ["|%S-|"] = "@text.reference",
      ["@%S+"] = "@parameter",
      ["^%s*(Parameters:)"] = "@text.title",
      ["^%s*(Return:)"] = "@text.title",
      ["^%s*(See also:)"] = "@text.title",
      ["{%S-}"] = "@parameter",
    },
  },
  health = {
    checker = true,
  },
  smart_move = {
    enabled = true,
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false,         -- use a classic bottom cmdline for search
    -- command_palette = true,       -- position the cmdline and popupmenu together
    command_palette = false,       -- position the cmdline and popupmenu together
    -- long_message_to_split = true, -- long messages will be sent to a split
    long_message_to_split = false, -- long messages will be sent to a split
    -- inc_rename = true,            -- enables an input dialog for inc-rename.nvim
    inc_rename = false,            -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
  -- throttle
  views = {
    popupmenu = {
      zindex = 65,
      position = "auto",
      size = {
        width = "auto",
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceBody",
          FloatBorder = "NoiceBorder",
          CursorLine = "PmenuSel",
          PmenuMatch = "Special",
        },
      },
      border = {
        padding = { 0, 1 },
      },
    },
    notify = {
      backend = "notify",
      replace = true,
      format = "notify",
    },
    split = {
      backend = "split",
      enter = false,
      relative = "editor",
      position = "bottom",
      size = "20%",
      close = {
        keys = { "q", "<ESC>" },
      },
      win_options = {
        winhighlight = { Normal = "NoiceBody", FloatBorder = "NoiceBorder" },
        wrap = true,
      },
    },
    vsplit = {
      backend = "split",
      enter = false,
      relative = "editor",
      position = "right",
      size = "20%",
      close = {
        keys = { "q", "<ESC>" },
      },
      win_options = {
        winhighlight = { Normal = "NoiceBody", FloatBorder = "NoiceBorder" },
      },
    },
    popup = {
      backend = "popup",
      relative = "editor",
      close = {
        events = { "BufLeave" },
        keys = { "q" },
      },
      enter = true,
      border = {
        style = "rounded",
      },
      position = "50%",
      size = {
        width = "120",
        height = "20",
      },
      win_options = {
        winhighlight = { Normal = "NoiceBody", FloatBorder = "NoiceBorder" },
      },
    },
    hover = {
      view = "popup",
      relative = "cursor",
      zindex = 45,
      enter = false,
      anchor = "auto",
      size = {
        width = "auto",
        height = "auto",
        max_height = 20,
        max_width = 120,
      },
      position = { row = 1, col = 0 },
      win_options = {
        wrap = true,
        linebreak = true,
      },
    },
    cmdline = {
      backend = "popup",
      relative = "editor",
      position = {
        row = "100%",
        col = 0,
      },
      size = {
        height = "auto",
        width = "100%",
      },
      border = {
        style = "none",
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceBody",
          FloatBorder = "NoiceBorder",
          IncSearch = "IncSearch",
          Search = "Search",
        },
      },
    },
    mini = {
      backend = "mini",
      relative = "editor",
      align = "message-right",
      timeout = 2000,
      reverse = false,
      position = {
        row = -2,
        col = "100%",
      },
      size = "auto",
      border = {
        style = { " ", " ", " ", " ", " ", " ", " ", " " },
      },
      zindex = 60,
      win_options = {
        winblend = 0,
        winhighlight = {
          Normal = "NoiceBody",
          IncSearch = "IncSearch",
          Search = "Search",
          FloatBorder = "NoiceBody",
        },
      },
    },
    cmdline_popup = {
      backend = "popup",
      relative = "editor",
      focusable = false,
      enter = false,
      zindex = 60,
      position = {
        row = "90%",
        col = "50%",
      },
      size = {
        min_width = 60,
        width = "auto",
        height = "auto",
      },
      border = {
        style = { " ", " ", " ", " ", " ", " ", " ", " " },
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceBody",
          FloatBorder = "NoiceBorder",
          IncSearch = "IncSearch",
          Search = "Search",
        },
        cursorline = false,
      },
    },
    confirm = {
      backend = "popup",
      relative = "editor",
      focusable = false,
      align = "center",
      enter = false,
      zindex = 60,
      format = { "{confirm}" },
      position = {
        row = "50%",
        col = "50%",
      },
      size = "auto",
      border = {
        style = { " ", " ", " ", " ", " ", " ", " ", " " },
        padding = { 0, 1, 0, 1 },
        text = {
          top = " CONFIRM: ",
        },
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceBody",
          FloatBorder = "NoiceBorder",
        },
      },
    },
  },
  routes = {
    {
      view = "cmdline",
      filter = {
        event = "cmdline",
        find = "^%s*[/?]",
      },
    },
    {
      view = "confirm",
      filter = {
        any = {
          { event = "msg_show", kind = "confirm" },
          { event = "msg_show", kind = "confirm_sub" },
        },
      },
    },
    {
      view = "split",
      filter = {
        any = {
          { event = "msg_history_show" },
        },
      },
    },
    {
      view = "mini",
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      view = "mini",
      filter = {
        event = "msg_show",
        kind = { "", "echo", "echomsg" },
      },
      opts = {
        replace = false,
        merge = false,
        title = "LVIM IDE",
      },
    },
    {
      view = "mini",
      filter = { error = true },
      opts = {
        skip = true,
      },
    },
    {
      view = "mini",
      filter = { warning = true },
      opts = {
        skip = true,
      },
    },
    {
      view = "mini",
      filter = { event = "notify" },
      opts = {
        title = "LVIM IDE",
      },
    },
    {
      view = "notify",
      filter = {
        event = "noice",
        kind = { "stats", "debug" },
      },
      opts = {
        buf_options = { filetype = "lua" },
        replace = false,
        title = "LVIM IDE",
      },
    },
    {
      view = "mini",
      filter = { event = "lsp", kind = "progress" },
    },
  },
  -- status
  -- format
}
