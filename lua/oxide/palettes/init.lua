local config = require("oxide.config")

local M = {}

---@param variant string
---@return table
local function load_palette(variant)
	local palette = require("oxide.palettes." .. variant)
	return palette
end

---@param opts? table
---@return table
function M.setup(opts)
	opts = config.extend(opts)

	-- Determine variant
	local variant = opts.variant
	if variant == "auto" then
		variant = vim.o.background == "light" and "light" or "dark"
	end

	-- Load semantic colors
	local colors = load_palette(variant)
	
	-- Apply transparency if enabled
	if opts.transparent then
		colors.base = "NONE"
		colors.mantle = "NONE"
	end

	-- Allow user color overrides
	if opts.on_colors then
		colors = opts.on_colors(colors) or colors
	end

	return {
		colors = colors,
		config = opts,
	}
end

return M
