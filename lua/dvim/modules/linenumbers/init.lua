vim.g.line_number_interval = 10

local bg_color = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or "#000000"

local color_sign_column = vim.api.nvim_get_hl(0, { name = "SignColumn" })
if color_sign_column and color_sign_column.bg then
  bg_color = color_sign_column.bg
else
  local color_normal_nc = vim.api.nvim_get_hl(0, { name = "NormalNC" })
  if color_normal_nc and color_normal_nc.bg then
    bg_color = color_normal_nc.bg
  end
end

vim.cmd(string.format([[
  highlight DimLineNr guifg=#%x
  LineNumberIntervalEnable
]], bg_color))
