local null_ls = require("null-ls")
local null_ls_helpers = require("null-ls.helpers")

vim.g.godot_executable = "/Applications/Godot.app/Contents/MacOS/Godot"

local function get_local_ipv4()
  local result = vim.system({ "ipconfig", "getifaddr", "en0" }, { text = true }):wait()
  return vim.trim(result.stdout)
end

local host = os.getenv("GDScript_Host") or get_local_ipv4() or "localhost"
local port = os.getenv("GDScript_Port") or "6005"
local cmd = vim.lsp.rpc.connect(host, tonumber(port))

vim.lsp.config("gdscript", {
  cmd = cmd,
  filetypes = { "gd", "gdscript", "gdscript3" },
  root_markers = { "project.godot", ".git" },
})

vim.lsp.config("gdshader_lsp", {
  filetypes = { "gsl", "gdshader", "gdshaderinc" },
})

vim.lsp.enable("gdscript")
vim.lsp.enable("gdshader_lsp")
vim.lsp.enable("gdshaderinc")

-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/HELPERS.md
local gdformat_source = {
  method = { null_ls.methods.FORMATTING, null_ls.methods.RANGE_FORMATTING },
  filetypes = { "gd", "gdscript", "gdscript3" },
  generator = null_ls_helpers.formatter_factory({
    command = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/bin/gdformat"),
    args = { "$FILENAME" },
    -- args = { "$FILENAME" },
    to_temp_file = true,
    from_temp_file = true,
    -- use_cache = true,
  }),
}

null_ls.setup({
  sources = {
    gdformat_source,
  },
})

-- util.root_pattern("project.godot", ".git")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.gd", "*.gdscript", "*.gdscript3" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.autoindent = true
    vim.opt_local.expandtab = false
  end,
})

-- auto-remove unused imports when saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.gd" },
  callback = function()
    vim.lsp.buf.format({})
  end,
})
