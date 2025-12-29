-- default settings
local origami = require("origami")

origami.setup()

vim.keymap.set("n", "<Left>", function()
  origami.h()
end)
vim.keymap.set("n", "<Right>", function()
  origami.l()
end)
vim.keymap.set("n", "<End>", function()
  origami.dollar()
end)
