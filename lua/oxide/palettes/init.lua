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

	-- UI colors (semantic mapping from palette)
	theme.ui = {
		bg = opts.transparent and "NONE" or palette.bg,
		bg_dark = palette.bg_dark,
		bg_light = palette.bg_light,
		bg_float = opts.transparent and "NONE" or palette.bg_float,
		fg = palette.fg,
		fg_dark = palette.fg_dark,
		fg_light = palette.fg_light,

		-- Borders and separators
		border = palette.gray_dark,
		border_highlight = palette.accent_main,

		-- Selection and search
		selection = util.blend(palette.accent_main, palette.bg, 0.3),
		search = util.blend(palette.yellow, palette.bg, 0.3),

		-- Cursor and line
		cursor_line = palette.bg_light,
		cursor = palette.accent_main,

		-- Status and info
		statusline = palette.bg_mid,
		statusline_nc = palette.bg_dark,

		-- Popup menus
		pmenu = {
			bg = palette.bg_mid,
			fg = palette.fg,
			sel_bg = palette.accent_main,
			sel_fg = palette.bg,
			sbar = palette.bg_light,
			thumb = palette.gray,
		},
	}

	-- Syntax colors (semantic mapping from palette)
	theme.syn = {
		comment = palette.gray,
		string = palette.green,
		number = palette.cyan,
		boolean = palette.cyan,
		constant = palette.cyan,
		identifier = palette.fg,
		function_name = palette.blue,
		keyword = palette.pink,
		operator = palette.pink,
		type = palette.cyan,
		preproc = palette.pink,
		special = palette.purple,
		error = palette.red,
		warning = palette.orange,
		info = palette.blue,
		hint = palette.gray_light,
	}

	-- Diagnostic colors
	theme.diag = {
		error = palette.red,
		warning = palette.orange,
		info = palette.blue,
		hint = palette.gray_light,
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
		add = util.blend(palette.green, palette.bg, 0.2),
		delete = util.blend(palette.red, palette.bg, 0.2),
		change = util.blend(palette.orange, palette.bg, 0.2),
		text = util.blend(palette.blue, palette.bg, 0.2),
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
