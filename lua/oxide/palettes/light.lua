-- Light mode palette - raw color definitions
local util = require("oxide.util")

---@class Palette
local M = {
  -- Background shades (lightest to darkest for light mode)
  bg_dark = "#f8f8f8",
  bg = "#ffffff",
  bg_mid = "#f0f0f0",
  bg_light = "#e8e8e8",
  bg_float = "#fcfcfc",

  -- Foreground shades (darkest to lightest for light mode)
  fg_dark = "#2d3748",
  fg = "#1a202c",
  fg_light = "#0f1419",

  -- Core accent colors (adjusted for light background)
  accent_main = "#0891b2",
  cyan = "#0891b2",
  blue = "#0369a1",
  blue_light = "#3b82f6",
  blue_accent = "#1d4ed8",
  green = "#059669",
  pink = "#be185d",
  pink_light = "#ec4899",
  purple = "#7c3aed",

  -- Semantic colors
  red = "#dc2626",
  orange = "#ea580c",
  yellow = "#d97706",

  -- Neutral colors
  gray = "#6b7280",
  gray_light = "#9ca3af",
  gray_dark = "#374151",

  -- Special colors
  none = "NONE",
}

-- Add darker/lighter variants
M.bg_darker = util.darken(M.bg, 0.05)
M.bg_lighter = util.lighten(M.bg, 0.02)
M.accent_main_dim = util.lighten(M.accent_main, 0.2)

return M