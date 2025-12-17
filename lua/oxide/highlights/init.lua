-- Main highlight manager
local M = {}

-- Import highlight modules
local editor = require("oxide.highlights.editor")
local syntax = require("oxide.highlights.syntax")
local treesitter = require("oxide.highlights.treesitter")
local lsp = require("oxide.highlights.lsp")

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

  -- Terminal colors
  if config.terminal_colors then
    local theme = colors.theme
    vim.g.terminal_color_0 = theme.ui.bg_dark
    vim.g.terminal_color_1 = theme.diag.error
    vim.g.terminal_color_2 = theme.git.add
    vim.g.terminal_color_3 = theme.diag.warning
    vim.g.terminal_color_4 = theme.syn.function_name
    vim.g.terminal_color_5 = theme.syn.special
    vim.g.terminal_color_6 = theme.syn.info
    vim.g.terminal_color_7 = theme.ui.fg
    vim.g.terminal_color_8 = theme.ui.fg_dark
    vim.g.terminal_color_9 = theme.diag.error
    vim.g.terminal_color_10 = theme.git.add
    vim.g.terminal_color_11 = theme.diag.warning
    vim.g.terminal_color_12 = theme.syn.function_name
    vim.g.terminal_color_13 = theme.syn.special
    vim.g.terminal_color_14 = theme.syn.info
    vim.g.terminal_color_15 = theme.ui.fg_light
  end

  -- Apply user overrides
  if config.on_highlights then
    highlights = config.on_highlights(highlights, colors) or highlights
  end

  return highlights
end

return M