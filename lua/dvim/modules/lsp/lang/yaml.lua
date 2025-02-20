local lspconfig = require("lspconfig")
local yamlCompanion = require("yaml-companion")
local schemastore = require("schemastore")

local cfg = yamlCompanion.setup({
  -- Add any options here, or leave empty to use the default settings
  -- lspconfig = {
  --   cmd = {"yaml-language-server"}
  -- },

  schemaStore = {
    -- You must disable built-in schemaStore support if you want to use
    -- this plugin and its advanced options like `ignore`.
    enable = false,
    -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
    url = "",
  },
  schemas = schemastore.yaml.schemas(),
  validate = { enable = true },
})

require("telescope").load_extension("yaml_schema")

lspconfig.yamlls.setup(cfg)

-- lspconfig.yamlls.setup {
--   -- on_attach = require'completion'.on_attach,
--   settings = {
--     yaml = {
--       schemaStore = {
--         -- You must disable built-in schemaStore support if you want to use
--         -- this plugin and its advanced options like `ignore`.
--         enable = false,
--         -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
--         url = "",
--       },
--       schemas = schemastore.yaml.schemas(),
--       -- schemas = { kubernetes = "globPattern" },
--     },
--   },
-- }
