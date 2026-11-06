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
  filetypes = { "gdscript" },
  root_markers = { "project.godot", ".git" },
})

vim.lsp.enable("gdscript")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.gd" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.autoindent = true
    vim.opt_local.expandtab = false
  end,
})
