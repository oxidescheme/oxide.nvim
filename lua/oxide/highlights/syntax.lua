-- Syntax highlighting groups
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
	local c = colors.colors
	local styles = config.styles or {}

	return {
		-- Comments
		Comment = vim.tbl_extend("force", { fg = c.overlay0 }, styles.comments or {}),

		-- Constants
		Constant = { fg = c.orange },
		String = vim.tbl_extend("force", { fg = c.green }, styles.strings or {}),
		Character = { fg = c.green },
		Number = vim.tbl_extend("force", { fg = c.orange }, styles.numbers or {}),
		Boolean = vim.tbl_extend("force", { fg = c.orange }, styles.booleans or {}),
		Float = { fg = c.orange },

		-- Identifiers (back to blue, variables white)
		Identifier = vim.tbl_extend("force", { fg = c.blue }, styles.variables or {}),
		Function = vim.tbl_extend("force", { fg = c.red }, styles.functions or {}),

		-- Statements
		Statement = { fg = c.lavender },
		Conditional = vim.tbl_extend("force", { fg = c.lavender }, styles.keywords or {}),
		Repeat = vim.tbl_extend("force", { fg = c.lavender }, styles.keywords or {}),
		Label = { fg = c.lavender },
		Operator = { fg = c.mauve },
		Keyword = vim.tbl_extend("force", { fg = c.lavender }, styles.keywords or {}),
		Exception = { fg = c.lavender },

		-- Preproc
		PreProc = { fg = c.teal },
		Include = { fg = c.teal },
		Define = { fg = c.teal },
		Macro = { fg = c.teal },
		PreCondit = { fg = c.teal },

		-- Types
		Type = { fg = c.sky },
		StorageClass = { fg = c.lavender },
		Structure = { fg = c.sky },
		Typedef = { fg = c.sky },

		-- Special
		Special = { fg = c.text },
		SpecialChar = { fg = c.text },
		Tag = { fg = c.pink },
		Delimiter = { fg = c.text },
		SpecialComment = { fg = c.overlay1 },
		Debug = { fg = c.pink },

		-- Error
		Error = { fg = c.red },
		Todo = { fg = c.yellow, bold = true },

		-- Added for better syntax support
		Variable = vim.tbl_extend("force", { fg = c.text }, styles.variables or {}),
		Field = { fg = c.text },
		Property = { fg = c.blue },
		Parameter = { fg = c.text },
	}
end

return M
