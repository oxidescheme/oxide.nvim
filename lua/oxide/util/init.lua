local M = {}

-- Color manipulation utilities
function M.blend(color1, color2, factor)
	if color1 == "NONE" or color2 == "NONE" then
		return "NONE"
	end

	local r1, g1, b1 = M.hex_to_rgb(color1)
	local r2, g2, b2 = M.hex_to_rgb(color2)

	local r = math.floor(r1 * (1 - factor) + r2 * factor)
	local g = math.floor(g1 * (1 - factor) + g2 * factor)
	local b = math.floor(b1 * (1 - factor) + b2 * factor)

	return M.rgb_to_hex(r, g, b)
end

function M.darken(color, amount)
	return M.blend(color, "#000000", amount)
end

function M.lighten(color, amount)
	return M.blend(color, "#ffffff", amount)
end

function M.hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

function M.rgb_to_hex(r, g, b)
	return string.format("#%02x%02x%02x", r, g, b)
end

-- Check if plugin is loaded
function M.has_plugin(plugin)
	return pcall(require, plugin)
end

-- Apply highlight group
function M.highlight(group, opts)
	if not opts then
		return
	end

	-- Handle link-only highlight groups
	if opts.link then
		vim.api.nvim_set_hl(0, group, { link = opts.link })
		return
	end

	-- Build highlight options for nvim_set_hl
	local hl_opts = {}

	-- Colors
	if opts.fg then
		hl_opts.fg = opts.fg
	end
	if opts.bg then
		hl_opts.bg = opts.bg
	end
	if opts.sp then
		hl_opts.sp = opts.sp
	end

	-- Styles
	if opts.style then
		-- Handle comma-separated styles like "bold,italic"
		local styles = vim.split(opts.style, ",")
		for _, style in ipairs(styles) do
			style = vim.trim(style)
			if style == "bold" then
				hl_opts.bold = true
			elseif style == "italic" then
				hl_opts.italic = true
			elseif style == "underline" then
				hl_opts.underline = true
			elseif style == "undercurl" then
				hl_opts.undercurl = true
			elseif style == "strikethrough" then
				hl_opts.strikethrough = true
			elseif style == "reverse" then
				hl_opts.reverse = true
			end
		end
	else
		-- Handle individual boolean style options
		if opts.bold then
			hl_opts.bold = true
		end
		if opts.italic then
			hl_opts.italic = true
		end
		if opts.underline then
			hl_opts.underline = true
		end
		if opts.undercurl then
			hl_opts.undercurl = true
		end
		if opts.strikethrough then
			hl_opts.strikethrough = true
		end
		if opts.reverse then
			hl_opts.reverse = true
		end
	end

	-- Apply the highlight group using the modern API
	vim.api.nvim_set_hl(0, group, hl_opts)
end

-- Apply multiple highlight groups
function M.apply_highlights(highlights)
	for group, opts in pairs(highlights) do
		M.highlight(group, opts)
	end
end

return M

