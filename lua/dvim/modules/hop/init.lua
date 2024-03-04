local hop_status_ok, hop = pcall(require, "hop")
if not hop_status_ok then
  return
end

hop.setup {}

local directions = require("hop.hint").HintDirection

-- easymotion-like
vim.keymap.set(
  { "n", "v" }, "<leader><leader>", "<cmd>HopWord<CR>",
  {
    noremap = true,
    desc = "Jump to word",
  }
)
