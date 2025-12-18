-- TreeSitter highlighting groups
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local theme = colors.theme

	return {
		-- Comments
		["@comment"] = { link = "Comment" },

		-- Constants
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = theme.syn.constant },
		["@constant.macro"] = { link = "Macro" },
		--
		-- -- Strings and characters
		["@string"] = { link = "String" },
		["@string.regex"] = { fg = theme.syn.special },
		["@string.escape"] = { fg = theme.syn.special },
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },
		--
		-- -- Numbers and booleans
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Float" },
		["@boolean"] = { link = "Boolean" },
		--
		-- Functions
		["@function"] = { link = "Function" },
		-- ["@function.builtin"] = { fg = theme.syn.function_name },
		-- ["@function.call"] = { link = "Function" },
		-- ["@function.macro"] = { link = "Macro" },
		["@function.method"] = { link = "Function" },
		-- ["@method"] = { link = "Function" },
		-- ["@method.call"] = { link = "Function" },
		["@constructor"] = { fg = theme.syn.type },
		--
		-- -- Keywords and operators
		["@keyword"] = { link = "Keyword" },
		-- ["@keyword.function"] = { link = "Keyword" },
		-- ["@keyword.operator"] = { link = "Keyword" },
		-- ["@keyword.return"] = { link = "Keyword" },
		-- ["@keyword.conditional"] = { link = "Conditional" },
		-- ["@keyword.repeat"] = { link = "Repeat" },
		-- ["@keyword.exception"] = { link = "Exception" },
		["@operator"] = { link = "Operator" },
		--
		-- Variables and identifiers
		["@variable"] = { link = "Variable" },
		-- ["@variable.builtin"] = { fg = theme.syn.special },
		["@variable.parameter"] = { link = "Parameter" },
		-- ["@variable.member"] = { link = "Field" },

		-- Types
		["@type"] = { link = "Type" },
		-- ["@type.builtin"] = { fg = theme.syn.type },
		["@type.definition"] = { link = "Typedef" },

		-- Fields and properties
		-- ["@field"] = { link = "Field" },
		["@property"] = { link = "Property" },
		["@attribute"] = { link = "PreProc" },
		--
		-- -- Punctuation
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { fg = theme.ui.fg },
		["@punctuation.special"] = { link = "Special" },
		--
		-- -- Tags (HTML, XML, etc.)
		-- ["@tag"] = { fg = theme.syn.keyword },
		-- ["@tag.attribute"] = { fg = theme.syn.identifier },
		-- ["@tag.delimiter"] = { fg = theme.ui.fg },
		--
		-- -- Labels
		-- ["@label"] = { link = "Label" },
		--
		-- Includes and namespaces
		-- ["@include"] = { link = "Include" },
		["@module"] = { fg = theme.syn.type },
		--
		-- Special cases
		["@warning"] = { fg = theme.syn.warning },
		["@danger"] = { fg = theme.syn.error },
		["@note"] = { fg = theme.syn.info },
		--
		-- Markup (markdown, etc.)
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.strike"] = { strikethrough = true },
		["@markup.heading"] = { fg = theme.syn.function_name, bold = true },
		["@markup.link"] = { fg = theme.syn.info, underline = true },
		["@markup.link.url"] = { fg = theme.syn.special, underline = true },
		["@markup.raw"] = { fg = theme.syn.string },
		["@markup.list"] = { fg = theme.syn.keyword },

		-- Diff
		["@diff.plus"] = { fg = theme.git.add },
		["@diff.minus"] = { fg = theme.git.delete },
		["@diff.delta"] = { fg = theme.git.change },
	}
end

return M
