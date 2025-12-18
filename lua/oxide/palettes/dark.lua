-- Dark mode palette - base16 color definitions
-- Based on base16 guidelines: https://github.com/chriskempson/base16/blob/main/styling.md

---@class Palette
local M = {
	-- Base16 background to foreground (base00-07)
	bg0 = "#141414", -- base00: Default Background
	bg1 = "#191919", -- base01: Lighter Background (status bars, line numbers)
	bg2 = "#232323", -- base02: Selection Background
	bg3 = "#4a4a4a", -- base03: Comments, Invisibles, Line Highlighting
	fg0 = "#c8cdd2", -- base04: Dark Foreground (status bars)
	fg1 = "#e0e4e8", -- base05: Default Foreground, Caret, Delimiters
	fg2 = "#f2f4f8", -- base06: Light Foreground
	fg3 = "#ffffff", -- base07: Light Background

	-- Base16 accent colors (base08-0F)
	red = "#ff6370", -- base08: Variables, XML Tags, Markup Link Text, Diff Deleted
	orange = "#ff9500", -- base09: Integers, Boolean, Constants, XML Attributes
	ocean = "#1aa7ff", -- base0A: Classes, Markup Bold, Search Text Background
	green = "#42be65", -- base0B: Strings, Inherited Class, Markup Code, Diff Inserted
	cyan = "#08bdba", -- base0C: Support, Regular Expressions, Escape Characters
	blue = "#33b1ff", -- base0D: Functions, Methods, Attribute IDs, Headings
	purple = "#be95ff", -- base0E: Keywords, Storage, Selector, Diff Changed
	pink = "#ee5396", -- base0F: Deprecated, Opening/Closing Language Tags

	-- Special colors
	none = "NONE",
}

return M
