-- Dark mode palette - raw color definitions
local util = require("oxide.util")

---@class Palette
local M = {
  -- Background shades (darkest to lightest)
  bg_dark = "#080808",
  bg = "#1a1a1a",
  bg_mid = "#2c2c2c",
  bg_light = "#444444",
  bg_float = "#0f0f0f",

  -- Foreground shades (darkest to lightest)
  fg_dark = "#c8cdd2",
  fg = "#e0e4e8",
  fg_light = "#f2f4f8",

  -- Core accent colors
  accent_main = "#08bdba",
  cyan = "#3ddbd9",
  blue = "#33b1ff",
  blue_light = "#78a9ff",
  blue_accent = "#82cfff",
  green = "#42be65",
  pink = "#ee5396",
  pink_light = "#ff7eb6",
  purple = "#be95ff",

  -- Semantic colors
  red = "#ff6b6b",
  orange = "#ffab40",
  yellow = "#ffd54f",

  -- Neutral colors
  gray = "#6f7579",
  gray_light = "#8b9196",
  gray_dark = "#4a4d52",

  -- Special colors
  none = "NONE",
}

-- Add darker/lighter variants
M.bg_darker = util.darken(M.bg, 0.3)
M.bg_lighter = util.lighten(M.bg, 0.1)
M.accent_main_dim = util.darken(M.accent_main, 0.3)

return M