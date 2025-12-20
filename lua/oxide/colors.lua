local config = require("oxide.config")

local M = {}

-- Oxide color palette
---@class Palette
local palette = {
	-- Surface colors
	base = "#141414", -- Main background
	mantle = "#191919", -- Sidebars, line numbers
	surface0 = "#232323", -- Selection background
	surface1 = "#2a2a2a", -- Subtle backgrounds
	surface2 = "#4a4a4a", -- Comments, borders, subtle elements

	-- Text colors
	text = "#cfcfcf", -- Primary text
	subtext0 = "#b8b8b8", -- Secondary text
	subtext1 = "#8a8a8a", -- Muted text

	-- Accent colors
	red = "#ff6370", -- Errors, critical items
	orange = "#ff9500", -- Warnings, numbers, constants
	yellow = "#ffd43b", -- Attention, search highlights
	green = "#42be65", -- Success, strings, added items
	teal = "#08bdba", -- Special elements, regex, escape chars
	sky = "#1aa7ff", -- Classes, types, bold markup
	sapphire = "#33b1ff", -- Functions, methods, headings
	blue = "#33b1ff", -- Variables, identifiers
	purple = "#be95ff", -- Keywords, storage, changed items
	pink = "#ee5396", -- Deprecated, special tags

	-- Special
	none = "NONE",
}

---@param opts? table
---@return table
function M.setup(opts)
	opts = config.extend(opts)

	-- Start with base palette
	local colors = {}
	for k, v in pairs(palette) do
		colors[k] = v
	end

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

