local hop = require("hop")
local directions = require("hop.hint").HintDirection

hop.setup({})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("CustomBufferKeymaps", { clear = true }),
  callback = function(args)
    local buftype = vim.bo[args.buf].buftype

    if buftype ~= "" then
      return
    end

    vim.keymap.set({ "n", "x", "o" }, "<CR>", function()
      hop.hint_words({
        direction = directions.AFTER_CURSOR | directions.BEFORE_CURSOR,
      })
    end, {
      buffer = args.buf,
      desc = "Hop to word",
      silent = true,
    })
  end,
})
