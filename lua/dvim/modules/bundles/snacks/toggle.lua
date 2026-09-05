Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>.s")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>.w")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>.N")
Snacks.toggle.diagnostics():map("<leader>.D")
Snacks.toggle.line_number():map("<leader>.n")
Snacks.toggle
  .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
  :map("<leader>.c")
Snacks.toggle.treesitter():map("<leader>.T")
Snacks.toggle.inlay_hints():map("<leader>.h")
Snacks.toggle.indent():map("<leader>.g")
Snacks.toggle.dim():map("<leader>.D")

function Snacks.toggle.autoformat_buffer()
  return Snacks.toggle.new({
    id = "autoformat_buffer",
    name = "Autoformat (buffer)",
    get = function()
      return not vim.b.disable_autoformat
    end,
    set = function(state)
      vim.b.disable_autoformat = not state
    end,
  })
end

function Snacks.toggle.autoformat_global()
  return Snacks.toggle.new({
    id = "autoformat_global",
    name = "Autoformat (global)",
    get = function()
      return not vim.g.disable_autoformat
    end,
    set = function(state)
      vim.g.disable_autoformat = not state
    end,
  })
end

Snacks.toggle.autoformat_buffer():map("<leader>.f")
Snacks.toggle.autoformat_global():map("<leader>.F")

function Snacks.toggle.diagnostics_inline()
  return Snacks.toggle.new({
    id = "diagnostics_inline",
    name = "Inline Diagnostics",
    get = function()
      return vim.diagnostic.config().virtual_lines
    end,
    set = function(state)
      if state then
        vim.diagnostic.config({ virtual_lines = { current_line = true } })
      else
        vim.diagnostic.config({ virtual_lines = false })
      end
    end,
  })
end

Snacks.toggle.diagnostics_inline():map("<leader>.d")
