local M = {}

-- Color manipulation utilities
function M.blend(color1, color2, factor)
  if color1 == "NONE" or color2 == "NONE" then
    return "NONE"
  end
  
  local r1, g1, b1 = M.hex_to_rgb(color1)
  local r2, g2, b2 = M.hex_to_rgb(color2)
  
  local r = math.floor(r1 * (1 - factor) + r2 * factor)
  local g = math.floor(g1 * (1 - factor) + g2 * factor)
  local b = math.floor(b1 * (1 - factor) + b2 * factor)
  
  return M.rgb_to_hex(r, g, b)
end

function M.darken(color, amount)
  return M.blend(color, "#000000", amount)
end

function M.lighten(color, amount)
  return M.blend(color, "#ffffff", amount)
end

function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16),
         tonumber(hex:sub(3, 4), 16),
         tonumber(hex:sub(5, 6), 16)
end

function M.rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", r, g, b)
end

-- Check if plugin is loaded
function M.has_plugin(plugin)
  return pcall(require, plugin)
end

-- Apply highlight group
function M.highlight(group, opts)
  if not opts then
    return
  end
  
  local cmd = "highlight! " .. group
  
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
  
  if opts.style then
    cmd = cmd .. " gui=" .. opts.style
  else
    local styles = {}
    if opts.bold then table.insert(styles, "bold") end
    if opts.italic then table.insert(styles, "italic") end
    if opts.underline then table.insert(styles, "underline") end
    if opts.undercurl then table.insert(styles, "undercurl") end
    if opts.strikethrough then table.insert(styles, "strikethrough") end
    if opts.reverse then table.insert(styles, "reverse") end
    
    if #styles > 0 then
      cmd = cmd .. " gui=" .. table.concat(styles, ",")
    end
  end
  
  vim.cmd(cmd)
end

-- Apply multiple highlight groups
function M.apply_highlights(highlights)
  for group, opts in pairs(highlights) do
    M.highlight(group, opts)
  end
end

return M