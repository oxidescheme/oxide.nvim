-- Syntax highlighting groups
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local theme = colors.theme
	local styles = config.styles or {}

	return {
		-- Comments
		Comment = vim.tbl_extend("force", { fg = theme.syn.comment }, styles.comments or {}),

		-- Constants
		Constant = { fg = theme.syn.constant },
		String = vim.tbl_extend("force", { fg = theme.syn.string }, styles.strings or {}),
		Character = { fg = theme.syn.string },
		Number = vim.tbl_extend("force", { fg = theme.syn.number }, styles.numbers or {}),
		Boolean = vim.tbl_extend("force", { fg = theme.syn.boolean }, styles.booleans or {}),
		Float = { fg = theme.syn.number },

		-- Identifiers
		Identifier = vim.tbl_extend("force", { fg = theme.syn.identifier }, styles.variables or {}),
		Function = vim.tbl_extend("force", { fg = theme.syn.function_name }, styles.functions or {}),

		-- Statements
		Statement = { fg = theme.syn.keyword },
		Conditional = vim.tbl_extend("force", { fg = theme.syn.keyword }, styles.keywords or {}),
		Repeat = vim.tbl_extend("force", { fg = theme.syn.keyword }, styles.keywords or {}),
		Label = { fg = theme.syn.keyword },
		Operator = { fg = theme.syn.operator },
		Keyword = vim.tbl_extend("force", { fg = theme.syn.keyword }, styles.keywords or {}),
		Exception = { fg = theme.syn.keyword },

		-- PreProcessor
		PreProc = { fg = theme.syn.preproc },
		Include = { fg = theme.syn.preproc },
		Define = { fg = theme.syn.preproc },
		Macro = { fg = theme.syn.preproc },
		PreCondit = { fg = theme.syn.preproc },

		-- Type
		Type = { fg = theme.syn.type },
		StorageClass = { fg = theme.syn.keyword },
		Structure = { fg = theme.syn.type },
		Typedef = { fg = theme.syn.type },

		-- Special
		Special = { fg = theme.syn.special },
		SpecialChar = { fg = theme.syn.special },
		Tag = { fg = theme.syn.special },
		Delimiter = { fg = theme.ui.fg },
		SpecialComment = { fg = theme.syn.special },
		Debug = { fg = theme.syn.special },

		-- Errors and todos
		Error = { fg = theme.syn.error },
		Todo = { fg = theme.syn.warning, bold = true },

		-- Added for better syntax support
		Variable = vim.tbl_extend("force", { fg = theme.syn.identifier }, styles.variables or {}),
		Field = { fg = theme.syn.identifier },
		Property = { fg = theme.syn.property },
		Parameter = { fg = theme.syn.identifier },
	}
end

return M
