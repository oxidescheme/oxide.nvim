-- Main highlight manager
local M = {}

-- Import highlight modules
local editor = require("oxide.highlights.editor")
local syntax = require("oxide.highlights.syntax")
local treesitter = require("oxide.highlights.treesitter")
local lsp = require("oxide.highlights.lsp")

-- Auto-load all integration files
local function load_all_integrations(colors, config)
	local integrations = {}

	-- Get the runtime path to find integration files
	local integration_files = vim.fn.globpath(
		table.concat(vim.api.nvim_list_runtime_paths(), ","),
		"lua/oxide/highlights/integrations/*.lua",
		false,
		true
	)

	for _, filepath in ipairs(integration_files) do
		-- Extract module name from filepath
		local module_name = filepath:match("integrations/([^/]+)%.lua$")
		if module_name then
			local module_path = "oxide.highlights.integrations." .. module_name

			-- Try to require and setup the integration
			local success, integration_module = pcall(require, module_path)
			if success and integration_module and type(integration_module.setup) == "function" then
				local int_success, integration_highlights = pcall(integration_module.setup, colors, config)
				if int_success and integration_highlights then
					integrations = vim.tbl_extend("force", integrations, integration_highlights)
				end
			end
		end
	end

	return integrations
end

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local highlights = {}

	-- Merge all highlight groups
	highlights = vim.tbl_extend("force", highlights, editor.setup(colors, config))
	highlights = vim.tbl_extend("force", highlights, syntax.setup(colors, config))
	highlights = vim.tbl_extend("force", highlights, treesitter.setup(colors, config))
	highlights = vim.tbl_extend("force", highlights, lsp.setup(colors, config))

	-- Merge integrations (auto-discovered)
	highlights = vim.tbl_extend("force", highlights, load_all_integrations(colors, config))

	-- Terminal colors (using direct semantic colors)
	if config.terminal_colors then
		local c = colors.colors
		vim.g.terminal_color_0 = c.base
		vim.g.terminal_color_1 = c.red
		vim.g.terminal_color_2 = c.green
		vim.g.terminal_color_3 = c.orange
		vim.g.terminal_color_4 = c.sapphire
		vim.g.terminal_color_5 = c.lavender
		vim.g.terminal_color_6 = c.teal
		vim.g.terminal_color_7 = c.text
		vim.g.terminal_color_8 = c.subtext1
		vim.g.terminal_color_9 = c.red
		vim.g.terminal_color_10 = c.green
		vim.g.terminal_color_11 = c.orange
		vim.g.terminal_color_12 = c.sapphire
		vim.g.terminal_color_13 = c.lavender
		vim.g.terminal_color_14 = c.teal
		vim.g.terminal_color_15 = c.text
	end

	-- Apply user overrides
	if config.on_highlights then
		highlights = config.on_highlights(highlights, colors) or highlights
	end

	return highlights
end

return M

