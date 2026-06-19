require("dvim.modules.bundles.snacks.config")
require("dvim.modules.bundles.snacks.picker")
require("dvim.modules.bundles.snacks.toggle")

vim.api.nvim_create_user_command("Dashboard", function()
	Snacks.dashboard()
end, {})
