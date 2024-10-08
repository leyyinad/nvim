-- require("mini.tabline").setup {
--   options = {
--     section_separators = { "", "" },
--     component_separators = { "", "" },
--   }
-- }

-- require("mini.tabline").setup {
--   -- format = function(buf_id, label)
--   --   -- local suffix = vim.bo[buf_id].modified and '+ ' or ''
--   --   -- return MiniTabline.default_format(buf_id, label) .. suffix
--   --   return "" .. MiniTabline.default_format(buf_id, label) .. ""
--   -- end,
--
--   tabpage_section = 'right',
-- }

require("tabline").setup()
