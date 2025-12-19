-- Core editor highlight groups - Direct semantic colors only
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local c = colors.colors -- Direct semantic colors
	local styles = config.styles or {}

	return {
		-- Basic highlighting
		Normal = { fg = c.text, bg = c.base },
		NormalFloat = { fg = c.text, bg = config.transparent and "NONE" or c.base },
		NormalNC = { fg = c.text, bg = c.base },

		-- Cursor
		Cursor = { fg = c.base, bg = c.text },
		CursorLine = { bg = c.surface0 },
		CursorColumn = { bg = c.surface0 },
		CursorLineNr = { fg = c.text, bold = true },

		-- Line numbers
		LineNr = { fg = c.surface2 },
		SignColumn = { fg = c.surface2, bg = c.base },
		FoldColumn = { fg = c.surface2, bg = c.base },

		-- Folding
		Folded = { fg = c.subtext0, bg = c.surface1 },

		-- Search (direct semantic colors)
		Search = { bg = c.blue, fg = c.base },
		IncSearch = { bg = c.orange, fg = c.base },
		CurSearch = { bg = c.orange, fg = c.base },

		-- Visual selection
		Visual = { bg = c.surface1 },
		VisualNOS = { bg = c.surface1 },

		-- Messages and command line
		ModeMsg = { fg = c.text },
		MoreMsg = { fg = c.sapphire },
		ErrorMsg = { fg = c.red },
		WarningMsg = { fg = c.orange },

		-- Status line
		StatusLine = { fg = c.text, bg = c.mantle },
		StatusLineNC = { fg = c.subtext0, bg = c.mantle },

		-- Tab line
		TabLine = { fg = c.subtext0, bg = c.mantle },
		TabLineFill = { bg = c.mantle },
		TabLineSel = { fg = c.text, bg = c.surface0 },

		-- Popup menu
		Pmenu = { fg = c.text, bg = c.surface0 },
		PmenuSel = { fg = c.text, bg = c.surface1, bold = true },
		PmenuSbar = { bg = c.surface1 },
		PmenuThumb = { bg = c.surface2 },

		-- Borders
		FloatBorder = { fg = c.surface2, bg = config.transparent and "NONE" or c.base },
		WinSeparator = { fg = c.surface2 },
		VertSplit = { fg = c.surface2 }, -- Legacy

		-- Diff highlighting (simple direct colors)
		DiffAdd = { bg = c.green, fg = c.base },
		DiffDelete = { bg = c.red, fg = c.base },
		DiffChange = { bg = c.blue, fg = c.base },
		DiffText = { bg = c.sapphire, fg = c.base },

		-- Spell checking
		SpellBad = { sp = c.red, undercurl = true },
		SpellCap = { sp = c.orange, undercurl = true },
		SpellLocal = { sp = c.sapphire, undercurl = true },
		SpellRare = { sp = c.teal, undercurl = true },

		-- Misc
		Directory = { fg = c.sapphire },
		Title = { fg = c.red, bold = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Underlined = { underline = true },

		-- Terminal
		Terminal = { fg = c.text, bg = c.base },

		-- Others
		NonText = { fg = c.surface2 },
		EndOfBuffer = { fg = c.base },
		Conceal = { fg = c.subtext1 },
		SpecialKey = { fg = c.subtext1 },
		Whitespace = { fg = c.surface2 },
		WildMenu = { fg = c.text, bg = c.surface1 },
		MatchParen = { fg = c.text, bg = c.surface2, underline = true },
	}
end

return M
