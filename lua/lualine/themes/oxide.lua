-- Copyright (c) 2024 oxide.nvim
-- MIT license, see LICENSE for more details.
-- Monochromatic lualine theme that blends seamlessly with oxide colorscheme

-- Get oxide palette and configuration (dark-only)
local palette_setup = require("oxide.colors").setup()
local colors = palette_setup.colors
local config = palette_setup.config

-- Helper function to handle transparency
local function bg_color(color)
	return config.transparent and "NONE" or color
end

-- Monochromatic theme with subtle mode variations using surface colors
-- Only section A differs with subtle monochromatic background changes
local theme = {
	normal = {
		a = { bg = bg_color(colors.base), fg = colors.text, gui = "bold" },
		b = { bg = bg_color(colors.base), fg = colors.text },
		c = { bg = bg_color(colors.base), fg = colors.text },
	},
	insert = {
		a = { bg = colors.surface0, fg = colors.text, gui = "bold" },
		b = { bg = bg_color(colors.base), fg = colors.text },
		c = { bg = bg_color(colors.base), fg = colors.text },
	},
	visual = {
		a = { bg = colors.surface1, fg = colors.text, gui = "bold" },
		b = { bg = bg_color(colors.base), fg = colors.text },
		c = { bg = bg_color(colors.base), fg = colors.text },
	},
	replace = {
		a = { bg = colors.surface2, fg = colors.text, gui = "bold" },
		b = { bg = bg_color(colors.base), fg = colors.text },
		c = { bg = bg_color(colors.base), fg = colors.text },
	},
	command = {
		a = { bg = colors.mantle, fg = colors.text, gui = "bold" },
		b = { bg = bg_color(colors.base), fg = colors.text },
		c = { bg = bg_color(colors.base), fg = colors.text },
	},
	terminal = {
		a = { bg = colors.surface0, fg = colors.text, gui = "bold" },
		b = { bg = bg_color(colors.base), fg = colors.text },
		c = { bg = bg_color(colors.base), fg = colors.text },
	},
	inactive = {
		a = { bg = bg_color(colors.base), fg = colors.text },
		b = { bg = bg_color(colors.base), fg = colors.text },
		c = { bg = bg_color(colors.base), fg = colors.text },
	},
}

return theme
