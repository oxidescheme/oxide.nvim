-- LSP and diagnostic highlighting groups
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
  local theme = colors.theme

  local highlights = {
    -- LSP semantic tokens
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.macro"] = { link = "@constant.macro" },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

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