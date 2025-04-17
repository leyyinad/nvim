local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  return
end

if #vim.api.nvim_list_uis() == 0 then
  return
end

local navic_ok, navic = pcall(require, "nvim-navic")

local function get_schema()
  local yaml_companion_ok, yaml_companion = pcall(require, "yaml-companion")

  if not yaml_companion_ok then
    return ""
  end

  local schema = yaml_companion.get_buf_schema(0)
  if schema.result[1].name == "none" then
    return ""
  end

  return schema.result[1].name
end

lualine.setup({
  options = {
    highlight = true,
    icons_enabled = true,
    color_correction = "static",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true,
    disabled_filetypes = {
      "alpha",
      "man"
    },
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        hide_filename_extension = true,
        symbols = {
          modified = " ",
          alternate_file = " ",
          directory = " ",
        },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "diagnostics" },
    lualine_y = { "branch" },
    lualine_z = { "tabs" },
  },
  winbar = {
    lualine_a = {
      {
        "filename",
        path = 0,
        symbols = {
          modified = "",
          readonly = "󰌾",
          unnamed = "󰇘",
          newfile = "",
        },
      },
    },
    lualine_c = {
      {
        function()
          return navic_ok and navic.get_location() or ""
        end,
        cond = function()
          return navic_ok and navic.is_available() or false
        end,
      },
    },
    lualine_z = {
      {
        "filetype",
        colored = true,
      },
    },
  },
  inactive_winbar = {
    lualine_a = {
      {
        "filename",
        path = 1,
      },
    },
    lualine_c = {},
  },
  sections = {
    lualine_c = {
      {
        function()
          return navic_ok and navic.get_location() or ""
        end,
        cond = function()
          return navic_ok and navic.is_available() or false
        end,
      },
    },
    lualine_x = { "encoding", "fileformat", "filetype", get_schema },
  },
  inactive_sections = {
    lualine_c = {
      {
        function()
          return navic_ok and navic.get_location() or ""
        end,
        cond = function()
          return navic_ok and navic.is_available() or false
        end,
      },
    },
  },
})
