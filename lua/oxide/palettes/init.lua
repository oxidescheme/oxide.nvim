local config = require("oxide.config")
local util = require("oxide.util")

local M = {}

---@param variant string
---@return table
local function load_palette(variant)
	local palette = require("oxide.palettes." .. variant)
	return palette
end

---@param palette table
---@param opts table
---@return table
local function create_theme(palette, opts)
	local theme = {}

	-- UI colors (semantic mapping from base16 palette)
	theme.ui = {
		bg = opts.transparent and "NONE" or palette.bg0,
		bg_dark = palette.bg1,
		bg_light = palette.bg2,
		bg_float = opts.transparent and "NONE" or palette.bg0,
		fg = palette.fg1,
		fg_dark = palette.bg3,
		fg_light = palette.fg2,

		-- Borders and separators
		border = palette.bg3,
		border_highlight = palette.cyan,

		-- Selection and search
		selection = palette.bg2,
		search = util.blend(palette.ocean, palette.bg0, 0.3),

		-- Cursor and line
		cursor_line = palette.bg2,
		cursor = palette.fg2,

		-- Status and info
		statusline = palette.bg1,
		statusline_nc = palette.bg1,

		-- Popup menus
		pmenu = {
			bg = palette.bg1,
			fg = palette.fg1,
			sel_bg = palette.cyan,
			sel_fg = palette.bg0,
			sbar = palette.bg2,
			thumb = palette.bg3,
		},
	}

	-- Syntax colors (base16 semantic mapping)
	theme.syn = {
		comment = palette.bg3, -- base03: Comments

		string = palette.green, -- base0B: Strings
		number = palette.orange, -- base09: Numbers/Constants
		boolean = palette.orange, -- base09: Boolean/Constants
		constant = palette.orange, -- base09: Constants
		property = palette.blue,
		identifier = palette.fg1, -- base08: Variables/Identifiers
		function_name = palette.red, -- base0D: Functions
		keyword = palette.purple, -- base0E: Keywords
		operator = palette.fg1, -- base05: Operators
		type = palette.ocean, -- base0A: Classes/Types
		preproc = palette.cyan, -- base0C: Preprocessor
		special = palette.fg0, -- base0F: Special/Deprecated
		error = palette.red,
		warning = palette.orange,
		info = palette.blue,
		hint = palette.bg3,
	}

	-- Diagnostic colors
	theme.diag = {
		error = palette.red,
		warning = palette.orange,
		info = palette.blue,
		hint = palette.fg0,
		ok = palette.green,
	}

	-- Git colors
	theme.git = {
		add = palette.green,
		delete = palette.red,
		change = palette.orange,
		conflict = palette.purple,
	}

	-- Diff colors
	theme.diff = {
		add = util.blend(palette.green, palette.bg0, 0.2),
		delete = util.blend(palette.red, palette.bg0, 0.2),
		change = util.blend(palette.orange, palette.bg0, 0.2),
		text = util.blend(palette.blue, palette.bg0, 0.2),
	}

	return theme
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

	-- Load palette and create theme
	local palette = load_palette(variant)
	local theme = create_theme(palette, opts)

	-- Allow user color overrides
	if opts.on_colors then
		palette = opts.on_colors(palette) or palette
		theme = create_theme(palette, opts)
	end

	return {
		palette = palette,
		theme = theme,
		config = opts,
	}
end

return M
