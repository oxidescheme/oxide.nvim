local config = require("oxide.config")
local colors = require("oxide.palettes")
local highlights = require("oxide.highlights")
local util = require("oxide.util")

local M = {}

---@param opts? table
function M.setup(opts)
	config.setup(opts)
end

---@param opts? table
function M.load(opts)
	-- Clear existing highlights
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "oxide"

	-- Get colors and highlights
	local color_scheme = colors.setup(opts)
	local highlight_groups = highlights.setup(color_scheme, color_scheme.config)

	-- Apply all highlights
	util.apply_highlights(highlight_groups)
end

-- Convenience function to load with current config
function M.colorscheme()
	M.load()
end

return M
