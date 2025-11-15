local lspconfig = require("lspconfig")
local yamlCompanion = require("yaml-companion")
local schemastore = require("schemastore")

local yaml_schema_mappings = {
  -- Kubernetes Schema
  kubernetes = {
    "configmap",
    "deployment",
    "service",
    "ingress",
    "secret",
    "persistentClaim",
  },
  -- Kustomize Schema
  ["https://json.schemastore.org/kustomization.json"] = {
    "kustomization",
  },
  -- GitLab Schema
  ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
    ".gitlab-ci",
    "-common",
    "-template",
  },
}

-- local cfg = yamlCompanion.setup({
--   -- Add any options here, or leave empty to use the default settings
--   -- lspconfig = {
--   --   cmd = {"yaml-language-server"}
--   -- },
--
--   schemaStore = {
--     -- You must disable built-in schemaStore support if you want to use
--     -- this plugin and its advanced options like `ignore`.
--     enable = false,
--     -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
--     url = "",
--   },
--   schemas = schemastore.yaml.schemas(),
--   validate = { enable = true },
-- })

-- local cfg = yamlCompanion.setup({})
-- lspconfig.yamlls.setup(cfg)

-- require("telescope").load_extension("yaml_schema")

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

-- https://www.arthurkoziel.com/json-schemas-in-neovim/
-- https://github.com/someone-stole-my-name/yaml-companion.nvim

local cfg = yamlCompanion.setup({
  schemas = {
    -- not loaded automatically, manually select with
    -- :Telescope yaml_schema
    {
      name = "Argo CD Application",
      uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
    },
    {
      name = "SealedSecret",
      uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/bitnami.com/sealedsecret_v1alpha1.json",
    },
    {
      name = "Kubernetes 1.32.1",
      uri = "https://github.com/yannh/kubernetes-json-schema/raw/refs/heads/master/v1.32.1-standalone-strict/all.json",
    },

    -- schemas below are automatically loaded, but added
    -- them here so that they show up in the statusline
    {
      name = "Kustomization",
      uri = "https://json.schemastore.org/kustomization.json",
    },
    {
      name = "GitHub Workflow",
      uri = "https://json.schemastore.org/github-workflow.json",
    },
  },

  lspconfig = {
    -- https://github.com/redhat-developer/yaml-language-server/issues/998
    on_attach = function(client, bufnr)
      if vim.bo.filetype == "yaml" or vim.bo.filetype == "yml" then
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local filename = vim.fn.fnamemodify(bufname, ":t") -- Get just the filename
        -- Find the matching schema
        local selected_schema = nil
        for schema_url, patterns in pairs(yaml_schema_mappings) do
          for _, pattern in ipairs(patterns) do
            if filename:match("^" .. pattern) then
              selected_schema = schema_url
              break
            end
          end
          if selected_schema then
            break
          end
        end

        -- Apply the schema dynamically
        if selected_schema then
          client.config.settings.yaml.schemas = { [selected_schema] = "*" }
        end
      end
    end,

    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = true,
        schemaStore = {
          enable = false,
          url = "",
        },
        keyOrdering = false,
        schemas = schemastore.yaml.schemas({
          -- ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] =
          -- "/*.yaml",

          -- select = {
          --   "kustomization.yaml",
          --   "docker-compose.yml",
          -- },
          -- extra = {},
        }),
      },
    },
  },
})

lspconfig.yamlls.setup(cfg)
-- require("telescope").load_extension("yaml_schema")
