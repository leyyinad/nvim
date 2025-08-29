local modules = require("dvim.modules")

local module_prefix = "dvim.modules."
local module_plugins_suffix = ".plugins"
local module_setup_suffix = ".setup"

local function load_plugins()
	local plugins = {}

	for _, module_name in ipairs(modules) do
		local module_plugins_path = module_prefix .. module_name .. module_plugins_suffix
		local module_status_ok, module_plugins = pcall(require, module_plugins_path)

		if module_status_ok and type(module_plugins) == "table" then
			for _, plugin in ipairs(module_plugins) do
				plugins[#plugins + 1] = plugin
			end
		end
	end

	require("lazy").setup(plugins)
end

local function setup_plugins()
	for _, module_name in ipairs(modules) do
		local module_setup_path = module_prefix .. module_name .. module_setup_suffix
		local module_status_ok, module_setup = pcall(require, module_setup_path)

		if not module_status_ok then
			if package.loaded[module_setup_path] then
				print(module_setup)
			end
		end
	end
end

load_plugins()
setup_plugins()
