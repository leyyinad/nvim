local godotdev = require("godotdev")

local function get_local_ipv4()
  local result = vim.system({ "ipconfig", "getifaddr", "en0" }, { text = true }):wait()
  return vim.trim(result.stdout)
end

godotdev.setup({
  editor_host = get_local_ipv4(),
})
