local ansi_ok, ansi = pcall(require, "ansi")

Snacks.toggle.option("spell", { name = "spelling" }):map("<leader>.s")
Snacks.toggle.option("wrap", { name = "wrap" }):map("<leader>.w")
Snacks.toggle.option("relativenumber", { name = "relative Number" }):map("<leader>.N")
Snacks.toggle.diagnostics():map("<leader>.D")
Snacks.toggle.line_number():map("<leader>.n")
Snacks.toggle
  .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
  :map("<leader>.c")
Snacks.toggle.treesitter():map("<leader>.T")
Snacks.toggle.inlay_hints():map("<leader>.h")
Snacks.toggle.indent():map("<leader>.g")

---@class Snacks

---@class snacks.toggle
---@field autoformat_buffer? fun(self:snacks.toggle)
---@field autoformat_global? fun(self:snacks.toggle)
---@field diagnostics_inline? fun(self:snacks.toggle)
---@field ansi? fun(self:snacks.toggle)

function Snacks.toggle.autoformat_buffer()
  return Snacks.toggle.new({
    id = "autoformat_buffer",
    name = "autoformat (buffer)",
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
    name = "autoformat (global)",
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
    name = "inline diagnostics",
    get = function()
      return vim.diagnostic.config().virtual_lines ~= false
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

if ansi_ok then
  function Snacks.toggle.ansi()
    return Snacks.toggle.new({
      id = "ansi",
      name = "ansi",
      get = function()
        return vim.wo.conceallevel > 0
      end,
      set = function()
        ansi.toggle()
      end,
    })
  end

  Snacks.toggle.ansi():map("<leader>.a")
end
