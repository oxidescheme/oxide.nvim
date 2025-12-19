-- Oxide dark palette - Direct semantic approach inspired by Catppuccin
-- No more base16 constraints - each color has a clear semantic purpose

---@class Palette
local M = {
	-- Surface colors (backgrounds, ordered dark to light)
	base = "#141414", -- Main background
	mantle = "#191919", -- Sidebars, line numbers
	surface0 = "#232323", -- Selection background
	surface1 = "#2a2a2a", -- Subtle backgrounds
	surface2 = "#4a4a4a", -- Comments, borders, subtle elements

	-- Text colors (foregrounds, ordered light to dark)
	text = "#e0e4e8", -- Primary text
	subtext0 = "#c8cdd2", -- Secondary text
	subtext1 = "#5a5a5a", -- Muted text

	-- Semantic colors with clear purposes
	red = "#ff6370", -- Errors, critical items
	orange = "#ff9500", -- Warnings, numbers, constants
	yellow = "#ffd43b", -- Attention, search highlights
	green = "#42be65", -- Success, strings, added items
	teal = "#08bdba", -- Special elements, regex, escape chars
	sky = "#1aa7ff", -- Classes, types, bold markup
	sapphire = "#33b1ff", -- Functions, methods, headings
	blue = "#33b1ff", -- Variables, identifiers (your preference!)
	purple = "#be95ff", -- Keywords, storage, changed items
	pink = "#ee5396", -- Deprecated, special tags
	mauve = "#d4a5ff", -- Operators, punctuation

	-- Special
	none = "NONE",
}

return M
