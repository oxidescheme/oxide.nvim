-- LSP and diagnostic highlighting groups - Direct semantic colors
local M = {}

---@param colors table
---@param config table
---@return table
function M.setup(colors, config)
  local c = colors.colors

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
    ["@lsp.type.parameter"] = { fg = c.blue },
    ["@lsp.type.property"] = { fg = c.blue },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.variable"] = { fg = c.blue },

    -- LSP semantic token modifiers
    ["@lsp.mod.readonly"] = { fg = c.sky },
    ["@lsp.mod.static"] = { fg = c.lavender },
    ["@lsp.mod.deprecated"] = { fg = c.pink, strikethrough = true },

    -- Diagnostic highlights
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.orange },
    DiagnosticInfo = { fg = c.sapphire },
    DiagnosticHint = { fg = c.teal },

    -- Diagnostic underlines
    DiagnosticUnderlineError = { sp = c.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.orange, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.sapphire, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.teal, undercurl = true },

    -- Diagnostic virtual text
    DiagnosticVirtualTextError = { fg = c.red, bg = "NONE" },
    DiagnosticVirtualTextWarn = { fg = c.orange, bg = "NONE" },
    DiagnosticVirtualTextInfo = { fg = c.sapphire, bg = "NONE" },
    DiagnosticVirtualTextHint = { fg = c.teal, bg = "NONE" },

    -- LSP references
    LspReferenceText = { bg = c.surface1 },
    LspReferenceRead = { bg = c.surface1 },
    LspReferenceWrite = { bg = c.surface1 },

    -- LSP signature help
    LspSignatureActiveParameter = { fg = c.orange, bold = true },

    -- LSP code lens
    LspCodeLens = { fg = c.overlay1 },
    LspCodeLensSeparator = { fg = c.overlay0 },

    -- LSP inlay hints
    LspInlayHint = { fg = c.overlay1, bg = c.surface0 },
  }

  return highlights
end

return M