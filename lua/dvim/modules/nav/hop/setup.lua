local hop = require("hop")
local directions = require("hop.hint").HintDirection

hop.setup({})

vim.keymap.set({ "n", "x", "o" }, "<CR>", function()
  hop.hint_words({
    direction = directions.AFTER_CURSOR | directions.BEFORE_CURSOR,
  })
end, {
  remap = true,
})
