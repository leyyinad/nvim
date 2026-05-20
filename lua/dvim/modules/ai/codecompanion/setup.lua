require("codecompanion").setup({
  adapters = {
    http = {
      ollama = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            -- url = "http://192.168.178.34:11434",
            url = "http://192.168.178.34:1234",
          },
          headers = {
            ["Content-Type"] = "application/json",
          },
          parameters = {
            sync = true,
          },
        })
      end,
    },
  },
  interactions = {
    chat = {
      adapter = "ollama"
    },
    inline = {
      adapter = "ollama"
    },
    cmd = {
      adapter = "ollama"
    },
  },
  -- opts = {
  --   log_level = "DEBUG",
  -- },
})

vim.keymap.set({ "n", "v" }, "<leader>a", "", { desc = "AI" })
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Open CodeCompanion Chat" })
vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "Inline CodeCompanion" })
vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion Actions" })
