-- TreeSitter highlighting groups - Direct semantic colors
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local c = colors.colors

	return {
		-- Comments
		["@comment"] = { link = "Comment" },

		-- Constants
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = c.orange },
		["@constant.macro"] = { link = "Macro" },

		-- Strings and characters
		["@string"] = { link = "String" },
		["@string.special"] = { fg = c.pink },
		["@character"] = { link = "Character" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@float"] = { link = "Float" },

		-- Identifiers and variables (your blue variables!)
		["@variable"] = { fg = c.blue },
		["@variable.builtin"] = { fg = c.blue },
		["@variable.parameter"] = { fg = c.blue },
		["@variable.member"] = { fg = c.blue },
		["@property"] = { fg = c.blue },
		["@field"] = { fg = c.blue },

		-- Functions
		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = c.red },
		["@function.macro"] = { fg = c.red },
		["@function.call"] = { fg = c.red },
		["@method"] = { fg = c.red },
		["@method.call"] = { fg = c.red },
		["@constructor"] = { fg = c.red },

		-- Keywords
		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { fg = c.lavender },
		["@keyword.return"] = { fg = c.lavender },
		["@keyword.operator"] = { fg = c.lavender },
		["@conditional"] = { link = "Conditional" },
		["@repeat"] = { link = "Repeat" },
		["@exception"] = { link = "Exception" },

		-- Operators
		["@operator"] = { link = "Operator" },

		-- Types
		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = c.sky },
		["@type.definition"] = { fg = c.sky },
		["@storageclass"] = { link = "StorageClass" },
		["@structure"] = { link = "Structure" },

		-- Preprocessor
		["@preproc"] = { link = "PreProc" },
		["@include"] = { link = "Include" },
		["@define"] = { link = "Define" },

		-- Special
		["@special"] = { link = "Special" },
		["@tag"] = { fg = c.pink },
		["@tag.attribute"] = { fg = c.teal },
		["@tag.delimiter"] = { fg = c.text },

		-- Punctuation
		["@punctuation.delimiter"] = { fg = c.text },
		["@punctuation.bracket"] = { fg = c.text },
		["@punctuation.special"] = { fg = c.pink },

		-- Literals
		["@string.regex"] = { fg = c.teal },
		["@string.escape"] = { fg = c.pink },

		-- Markup (Markdown, etc.)
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.heading"] = { fg = c.sapphire, bold = true },
		["@markup.link"] = { fg = c.sky },
		["@markup.link.url"] = { fg = c.teal, underline = true },
		["@markup.list"] = { fg = c.lavender },

		-- Errors
		["@error"] = { link = "Error" },
		["@warning"] = { fg = c.orange },
	}
end

return M