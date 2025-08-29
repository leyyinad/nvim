local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
	return
end

if #vim.api.nvim_list_uis() == 0 then
	return
end

local navic_ok, navic = pcall(require, "nvim-navic")

local function get_schema()
	local yaml_companion_ok, yaml_companion = pcall(require, "yaml-companion")

	if not yaml_companion_ok then
		return ""
	end

	local schema = yaml_companion.get_buf_schema(0)
	if schema.result[1].name == "none" then
		return ""
	end

	return schema.result[1].name
end

local file_symbols = {
	modified = "", -- Text to show when the file is modified.
	readonly = "", -- Text to show when the file is non-modifiable or readonly.
	unnamed = "󰇘", -- Text to show for unnamed buffers.
	newfile = "", -- Text to show for newly created file before first write
}

lualine.setup({
	options = {
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		-- section_separators = { },
		component_separators = {},
		globalstatus = false,
		always_divide_middle = false,
		disabled_filetypes = {
			"alpha",
			"man",
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filetype",
				colored = true,
				icon_only = true,
				padding = { left = 1, right = 0 },
			},
			{
				"filename",
				path = 1,
				symbols = file_symbols,
				fmt = function(value)
					local p = vim.fn.fnamemodify(value, ":h")
					local n = vim.fn.fnamemodify(value, ":t")
					return "%#TabLine#" .. p .. "/%#Normal#" .. n
				end,
			},
		},
		lualine_x = {},
		lualine_y = { "progress" },
		lualine_z = { "location", { "diagnostics", always_visible = false } },
	},
	inactive_sections = {
		lualine_c = {
			{
				"filename",
				path = 0,
				symbols = file_symbols,
				color = "TabLine",
			},
		},
		lualine_x = { "location" },
	},
	tabline = {
		lualine_a = {
			{
				"tabs",
				separators = { left = "", right = "" },
				tab_max_length = 128,
				max_length = 1024,
				mode = 1,
				use_mode_colors = true,
				tabs_color = {
					active = "lualine_a_insert",
					inactive = "lualine_a_inactive",
				},
        symbols = file_symbols
			},
		},
		lualine_b = {},
		lualine_c = {},
	},
	extensions = {},
})
