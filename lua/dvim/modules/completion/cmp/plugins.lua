return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "onsails/lspkind.nvim",
      "petertriho/cmp-git",
      "saadparwaiz1/cmp_luasnip",
    },

    -- config = function(_, opts)
    --   local lspconfig = require("lspconfig")
    --   local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    --
    --   for server, config in pairs(opts.servers) do
    --     -- passing config.capabilities to blink.cmp merges with the capabilities in your
    --     -- `opts[server].capabilities, if you've defined it
    --     -- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    --     config.capabilities = lsp_capabilities
    --     lspconfig[server].setup(config)
    --   end
    -- end,
  },
}
