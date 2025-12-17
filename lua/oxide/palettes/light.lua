-- Light mode palette - base16 color definitions
-- Based on base16 guidelines: https://github.com/chriskempson/base16/blob/main/styling.md

---@class Palette
local M = {
	-- Base16 background to foreground (base00-07) - reversed for light theme
	bg0 = "#ffffff",        -- base00: Default Background
	bg1 = "#f8f8f8",        -- base01: Lighter Background (status bars, line numbers)
	bg2 = "#f0f0f0",        -- base02: Selection Background
	bg3 = "#e8e8e8",        -- base03: Comments, Invisibles, Line Highlighting
	fg0 = "#6b7280",        -- base04: Dark Foreground (status bars)
	fg1 = "#374151",        -- base05: Default Foreground, Caret, Delimiters
	fg2 = "#1f2937",        -- base06: Light Foreground
	fg3 = "#080808",        -- base07: Light Background

	-- Base16 accent colors (base08-0F) - adjusted for light background
	red = "#dc2626",        -- base08: Variables, XML Tags, Markup Link Text, Diff Deleted
	orange = "#ea580c",     -- base09: Integers, Boolean, Constants, XML Attributes
	yellow = "#d97706",     -- base0A: Classes, Markup Bold, Search Text Background
	green = "#059669",      -- base0B: Strings, Inherited Class, Markup Code, Diff Inserted
	cyan = "#0891b2",       -- base0C: Support, Regular Expressions, Escape Characters
	blue = "#0369a1",       -- base0D: Functions, Methods, Attribute IDs, Headings
	purple = "#7c3aed",     -- base0E: Keywords, Storage, Selector, Diff Changed
	pink = "#be185d",       -- base0F: Deprecated, Opening/Closing Language Tags

	-- Special colors
	none = "NONE",
}

return M