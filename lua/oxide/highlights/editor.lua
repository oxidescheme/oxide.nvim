-- Core editor highlight groups
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
  local theme = colors.theme
  local styles = config.styles or {}

  return {
    -- Basic highlighting
    Normal = { fg = theme.ui.fg, bg = theme.ui.bg },
    NormalFloat = { fg = theme.ui.fg, bg = theme.ui.bg_float },
    NormalNC = { fg = theme.ui.fg_dark, bg = theme.ui.bg },

    -- Cursor
    Cursor = { fg = theme.ui.bg, bg = theme.ui.cursor },
    CursorLine = { bg = theme.ui.cursor_line },
    CursorColumn = { bg = theme.ui.cursor_line },
    CursorLineNr = { fg = theme.ui.cursor, bold = true },

    -- Line numbers
    LineNr = { fg = theme.ui.fg_dark },
    SignColumn = { fg = theme.ui.fg_dark, bg = theme.ui.bg },
    FoldColumn = { fg = theme.ui.fg_dark, bg = theme.ui.bg },

    -- Folding
    Folded = { fg = theme.ui.fg_dark, bg = theme.ui.bg_light },

    -- Search
    Search = { bg = theme.ui.search },
    IncSearch = { bg = theme.ui.search },
    CurSearch = { bg = theme.ui.search },

    -- Visual selection
    Visual = { bg = theme.ui.selection },
    VisualNOS = { bg = theme.ui.selection },

    -- Messages and command line
    ModeMsg = { fg = theme.ui.fg },
    MoreMsg = { fg = theme.syn.info },
    ErrorMsg = { fg = theme.syn.error },
    WarningMsg = { fg = theme.syn.warning },

    -- Status line
    StatusLine = { fg = theme.ui.fg, bg = theme.ui.statusline },
    StatusLineNC = { fg = theme.ui.fg_dark, bg = theme.ui.statusline_nc },

    -- Tab line
    TabLine = { fg = theme.ui.fg_dark, bg = theme.ui.statusline_nc },
    TabLineFill = { bg = theme.ui.statusline_nc },
    TabLineSel = { fg = theme.ui.fg, bg = theme.ui.bg },

    -- Popup menu
    Pmenu = { fg = theme.ui.pmenu.fg, bg = theme.ui.pmenu.bg },
    PmenuSel = { fg = theme.ui.pmenu.sel_fg, bg = theme.ui.pmenu.sel_bg },
    PmenuSbar = { bg = theme.ui.pmenu.sbar },
    PmenuThumb = { bg = theme.ui.pmenu.thumb },

    -- Borders
    FloatBorder = { fg = theme.ui.border, bg = theme.ui.bg_float },
    WinSeparator = { fg = theme.ui.border },
    VertSplit = { fg = theme.ui.border }, -- Legacy

    -- Diff highlighting
    DiffAdd = { bg = theme.diff.add },
    DiffDelete = { bg = theme.diff.delete },
    DiffChange = { bg = theme.diff.change },
    DiffText = { bg = theme.diff.text },

    -- Spell checking
    SpellBad = { sp = theme.syn.error, undercurl = true },
    SpellCap = { sp = theme.syn.warning, undercurl = true },
    SpellLocal = { sp = theme.syn.info, undercurl = true },
    SpellRare = { sp = theme.syn.hint, undercurl = true },

    -- Misc
    Directory = { fg = theme.syn.function_name },
    Title = { fg = theme.syn.function_name, bold = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Underlined = { underline = true },

    -- Terminal colors
    Terminal = { fg = theme.ui.fg, bg = theme.ui.bg },
  }
end

return M