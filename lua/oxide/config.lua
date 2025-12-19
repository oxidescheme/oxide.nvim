---@class OxideConfig
---@field variant "dark" | "light" | "auto"
---@field transparent boolean
---@field terminal_colors boolean
---@field styles table<string, any>
---@field on_colors? fun(colors: table): table
---@field on_highlights? fun(highlights: table, colors: table): table

local M = {}

---@type OxideConfig
M.defaults = {
	variant = "auto", -- "dark", "light", "auto" (follows vim.o.background)
	transparent = false,
	terminal_colors = true,

	styles = {
		comments = { italic = true },
		keywords = { bold = true },
		variables = {},
		strings = {},
		booleans = {},
		numbers = {},
	},

	-- Override colors
	on_colors = nil,

	-- Override highlight groups
	on_highlights = nil,
}

---@type OxideConfig
M.options = M.defaults

---@param opts? table
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

---@param opts? table
---@return table
function M.extend(opts)
	return vim.tbl_deep_extend("force", {}, M.options, opts or {})
end

return M
