<div align="center">

# oxide

</div>

<h6 align="center">
Where function meets form.
</h6>

<p align="center">
  <a href="https://github.com/oxidescheme/oxide.nvim/stargazers"><img src="https://img.shields.io/github/stars/oxidescheme/oxide.nvim?colorA=141414&colorB=33b1ff&style=for-the-badge"></a>
  <!-- <a href="https://github.com/oxidescheme/oxide.nvim/releases/latest"><img src="https://img.shields.io/github/v/release/oxidescheme/oxide.nvim?colorA=141414&colorB=42be65&style=for-the-badge"></a> -->
  <a href="https://github.com/oxidescheme/oxide.nvim/issues"><img src="https://img.shields.io/github/issues/oxidescheme/oxide.nvim?colorA=141414&colorB=ff6370&style=for-the-badge"></a>
  <a href="https://www.lua.org/"><img src="https://img.shields.io/badge/Made%20with%20Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white"></a>
</p>

<p align="center">
  <img src="assets/dashboard.png" alt="oxide.nvim dashboard showcase">
</p>

<p align="center">
  <img src="assets/picker.png" alt="oxide.nvim picker showcase">
</p>

<p align="center">
  <img src="assets/syntax.png" alt="oxide.nvim syntax highlighting">
</p>

<p>
<b>oxide.nvim</b> brings the oxide colorscheme to Neovim with full TreeSitter and LSP support.
A minimalist dark theme built around clarity and restraint, using a deep near-black background, crisp white foregrounds, and soft pastel accents to emphasize structure without visual noise.
</p>

## Design Philosophy

oxide is built on three core principles:

- **Semantic Color**: Every hue has meaning—red for functions, blue for properties, white for variables
- **Cognitive Clarity**: Reduce mental overhead through consistent, predictable visual patterns
- **Aesthetic Restraint**: Beautiful doesn't mean busy; elegance lies in what's left out

The full design philosophy, color psychology research, and development methodology are documented
in the [main oxide repository](https://github.com/oxidescheme/oxide).

## Features

- **Dark theme focused**: A carefully crafted monochromatic dark theme
- **TreeSitter ready**: Full support for modern syntax highlighting  
- **LSP integrated**: Semantic highlighting that respects language servers
- **Customizable**: Override colors and highlights to match your workflow
- **Performance focused**: Lazy-loaded with minimal startup impact
- **Plugin support**: Built-in lualine theme and growing plugin integration

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "oxidescheme/oxide.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("oxide").setup()
    vim.cmd.colorscheme("oxide")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "oxidescheme/oxide.nvim",
  config = function()
    require("oxide").setup()
    vim.cmd.colorscheme("oxide")
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'oxidescheme/oxide.nvim'
```

```lua
require("oxide").setup()
vim.cmd.colorscheme("oxide")
```

## Usage

```lua
-- Basic usage
vim.cmd.colorscheme("oxide")

-- Or use the lua API
require("oxide").load()
```

## Configuration

oxide.nvim comes with sensible defaults, but every aspect can be customized:

```lua
require("oxide").setup({
  transparent = false, -- Enable transparent background
  terminal_colors = true, -- Configure terminal colors
  
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
    functions = {},
    variables = {},
    strings = {},
    booleans = {},
    numbers = {},
  },
  
  -- Override colors
  on_colors = function(colors)
    colors.red = "#ff0000" -- Make red more intense
  end,
  
  -- Override highlight groups
  on_highlights = function(highlights, colors)
    highlights.Comment = { fg = colors.green, italic = true }
  end,
})
```

### Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| `transparent` | `false` | Enable transparent background |
| `terminal_colors` | `true` | Set terminal colors |
| `styles` | `{}` | Style overrides for syntax groups |
| `on_colors` | `nil` | Function to override color palette |
| `on_highlights` | `nil` | Function to override highlight groups |

## Advanced Usage

### Custom Styles

```lua
require("oxide").setup({
  styles = {
    -- Remove all styling
    comments = {},
    -- Make functions stand out more
    functions = { bold = true, italic = true },
    -- Subtle variables
    variables = { italic = true },
  }
})
```

### Integration with Other Plugins

oxide.nvim works seamlessly with popular plugins:

- **[lualine](https://github.com/nvim-lualine/lualine.nvim)**: Built-in monochromatic oxide theme
- **[nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)**: Properly styled file explorer
- **[telescope](https://github.com/nvim-telescope/telescope.nvim)**: Clean search interface
- **[gitsigns](https://github.com/lewis6991/gitsigns.nvim)**: Clear git indicators
- **[snacks](https://github.com/folke/snacks.nvim)**: Clean and minimal components

## Contributing

We follow the same philosophy as the main oxide project: minimalism doesn't mean stagnation.

- Report bugs and request features through [GitHub Issues](https://github.com/oxidescheme/oxide.nvim/issues)
- PRs that improve clarity and consistency are especially welcome
- Ensure new highlight groups serve a clear functional purpose

## Credits

**Port Developer:** [@jakubmazur](https://github.com/jakmaz)
**Current Maintainer:** [@jakubmazur](https://github.com/jakmaz)
**Contributors:** See [contributors list](https://github.com/oxidescheme/oxide.nvim/graphs/contributors)

**Original oxide colorscheme:** [@originalcreator](https://github.com/oxidescheme)

## License

MIT License - see [LICENSE](LICENSE) for details.
