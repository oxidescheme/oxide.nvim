-- Main highlight manager
local M = {}

-- Import highlight modules
local editor = require("oxide.highlights.editor")
local syntax = require("oxide.highlights.syntax")
local treesitter = require("oxide.highlights.treesitter")
local lsp = require("oxide.highlights.lsp")

-- Import integrations
local snacks = require("oxide.highlights.integrations.snacks")

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
  local highlights = {}

  -- Merge all highlight groups
  highlights = vim.tbl_extend("force", highlights, editor.setup(colors, config))
  highlights = vim.tbl_extend("force", highlights, syntax.setup(colors, config))
  highlights = vim.tbl_extend("force", highlights, treesitter.setup(colors, config))
  highlights = vim.tbl_extend("force", highlights, lsp.setup(colors, config))

  -- Merge integrations
  highlights = vim.tbl_extend("force", highlights, snacks.setup(colors, config))

  -- Terminal colors (using direct semantic colors)
  if config.terminal_colors then
    local c = colors.colors
    vim.g.terminal_color_0 = c.base
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.orange
    vim.g.terminal_color_4 = c.sapphire
    vim.g.terminal_color_5 = c.lavender
    vim.g.terminal_color_6 = c.teal
    vim.g.terminal_color_7 = c.text
    vim.g.terminal_color_8 = c.subtext1
    vim.g.terminal_color_9 = c.red
    vim.g.terminal_color_10 = c.green
    vim.g.terminal_color_11 = c.orange
    vim.g.terminal_color_12 = c.sapphire
    vim.g.terminal_color_13 = c.lavender
    vim.g.terminal_color_14 = c.teal
    vim.g.terminal_color_15 = c.text
  end

  -- Apply user overrides
  if config.on_highlights then
    highlights = config.on_highlights(highlights, colors) or highlights
  end

  return highlights
end

return M