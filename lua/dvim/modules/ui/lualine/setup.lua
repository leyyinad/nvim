local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
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
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  winbar = {},
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
})
