local oxocarbon = require("oxocarbon").oxocarbon

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local colors_name = vim.g.colors_name or "default"

    if colors_name ~= "oxocarbon" then
      return
    end

    -- restore telescope border
    -- https://github.com/nyoom-engineering/oxocarbon.nvim/issues/41

    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = oxocarbon.base11, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = oxocarbon.base12, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = oxocarbon.base05, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = oxocarbon.base08, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = oxocarbon.base03, bg = oxocarbon.blend })

    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = oxocarbon.base09, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = oxocarbon.base12, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = oxocarbon.base09, bg = oxocarbon.blend })

    vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = oxocarbon.base06, bg = oxocarbon.base02 })
    vim.api.nvim_set_hl(0, "TelescopePreviewLine", { fg = oxocarbon.none, bg = oxocarbon.base01 })
    vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = oxocarbon.base09, bg = oxocarbon.none, bold = true })

    -- restore snacks picker border

    vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = oxocarbon.base11, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { fg = oxocarbon.base12, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "SnacksPickerPrompt", { fg = oxocarbon.base05, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "SnacksPickerDimmed", { fg = oxocarbon.base08, bg = oxocarbon.blend })
    vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = oxocarbon.base05 })
    vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = oxocarbon.base03 })
    vim.api.nvim_set_hl(0, "SnacksPickerSelected", { fg = oxocarbon.base06, bg = oxocarbon.base02 })
    vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = oxocarbon.base09, bg = oxocarbon.none, bold = true })

    -- vim.api.nvim_set_hl(0, "SnacksDashboardNormal", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = oxocarbon.base09, bg = oxocarbon.base12 })

    -- vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardTerminal", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardDir", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = oxocarbon.base09, bg = oxocarbon.base12 })
    -- vim.api.nvim_set_hl(0, "SnacksDashboardFile", { fg = oxocarbon.base09, bg = oxocarbon.base12 })

    -- transparent background
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  end,
})
