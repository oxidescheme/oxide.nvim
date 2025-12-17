-- LSP and diagnostic highlighting groups
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
  local theme = colors.theme

  local highlights = {
    -- LSP semantic tokens
    ["@lsp.type.class"] = { link = "Type" },
    ["@lsp.type.decorator"] = { link = "Function" },
    ["@lsp.type.enum"] = { link = "Type" },
    ["@lsp.type.enumMember"] = { link = "Constant" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.interface"] = { link = "Type" },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "Parameter" },
    ["@lsp.type.property"] = { link = "Property" },
    ["@lsp.type.struct"] = { link = "Type" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { link = "Type" },
    ["@lsp.type.variable"] = { link = "Variable" },

    -- Diagnostics
    DiagnosticError = { fg = theme.diag.error },
    DiagnosticWarn = { fg = theme.diag.warning },
    DiagnosticInfo = { fg = theme.diag.info },
    DiagnosticHint = { fg = theme.diag.hint },
    DiagnosticOk = { fg = theme.diag.ok },

    -- Diagnostic virtual text
    DiagnosticVirtualTextError = { fg = theme.diag.error, bg = theme.ui.bg },
    DiagnosticVirtualTextWarn = { fg = theme.diag.warning, bg = theme.ui.bg },
    DiagnosticVirtualTextInfo = { fg = theme.diag.info, bg = theme.ui.bg },
    DiagnosticVirtualTextHint = { fg = theme.diag.hint, bg = theme.ui.bg },

    -- Diagnostic underlines
    DiagnosticUnderlineError = { sp = theme.diag.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = theme.diag.warning, undercurl = true },
    DiagnosticUnderlineInfo = { sp = theme.diag.info, undercurl = true },
    DiagnosticUnderlineHint = { sp = theme.diag.hint, undercurl = true },

    -- Diagnostic signs (gutter)
    DiagnosticSignError = { fg = theme.diag.error },
    DiagnosticSignWarn = { fg = theme.diag.warning },
    DiagnosticSignInfo = { fg = theme.diag.info },
    DiagnosticSignHint = { fg = theme.diag.hint },

    -- LSP references
    LspReferenceText = { bg = theme.ui.selection },
    LspReferenceRead = { bg = theme.ui.selection },
    LspReferenceWrite = { bg = theme.ui.selection },

    -- LSP hover and signature help
    LspSignatureActiveParameter = { fg = theme.syn.warning, bold = true },

    -- Code lens
    LspCodeLens = { fg = theme.syn.comment },
    LspCodeLensSeparator = { fg = theme.syn.comment },

    -- Inlay hints
    LspInlayHint = { fg = theme.syn.hint, bg = theme.ui.bg_light },
  }

  return highlights
end

return M