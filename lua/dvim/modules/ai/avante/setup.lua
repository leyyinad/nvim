require("avante").setup({
  provider = "opencode",
  auto_suggestions_provider = nil,
  providers = {
    lmstudio = {
      endpoint = "http://127.0.0.1:11434",
      model = "qwen2.5-coder:14b",
      timeout = 30000,
      extra_request_body = {
        options = {
          temperature = 0.75,
          num_ctx = 20480
        }
      }
    },
    opencode = {
      __inherited_from = "openai",
      -- endpoint = "http://127.0.0.1:8090",
      -- endpoint = "https://opencode.ai/zen/v1/chat/completions",
      endpoint = "https://opencode.ai/zen/v1",
      model = "big-pickle",
      timeout = 30000,
      api_key_name = "OPENCODE_ZEN_KEY"
    }
  }
})

vim.keymap.set({ "n", "v" }, "<leader>a", "", { desc = "AI" })
vim.keymap.set({ "n", "v" }, "<leader>aa", function ()
  require("avante.api").ask()
end, { desc = "Avante Ask" }
)
vim.keymap.set({ "n", "v" }, "<leader>ae", function ()
  require("avante.api").edit()
end, { desc = "Avante Edit" }
)
vim.keymap.set("n", "<leader>ac", function ()
  require("avante.api").chat()
end, { desc = "Avante Chat" }
)
vim.keymap.set("n", "<leader>ar", function ()
  require("avante.api").refresh()
end, { desc = "Avante Refresh" }
)
