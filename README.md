zenburn.nvim
============

Zenburn for Neovim, retargeted at the look of the
[IntelliJ Zenburn plugin](https://plugins.jetbrains.com/plugin/17938-zenburn)
([smashedtoatoms/zenburn](https://github.com/smashedtoatoms/zenburn)).
Fork of [phha/zenburn.nvim](https://github.com/phha/zenburn.nvim), itself a
Lua port of Jani Nurminen's [Zenburn](https://github.com/jnurmine/Zenburn).

What is different from the Vim original:

- one keyword color, functions are bold text, fields are text, types teal,
  constants pale, comments dark green
- caret row darker than the background, quiet matched-brace background,
  underlined references instead of a search block
- no italics anywhere, bold only where IntelliJ has it (and a switch to drop it)
- Neovim 0.10+ treesitter captures and `@lsp.*` semantic tokens, so static
  methods, constants, interfaces and annotations get IntelliJ's colors
- plugin groups applied only for plugins lazy.nvim knows about

Every color comes from `reference/intellij/zenburn.xml`; see `SPEC.md` for
the attribute table and the decisions.

Install
-------

```lua
-- lazy.nvim
{ "gipo355/zenburn.nvim", priority = 1000, lazy = false }
```

Then `:colorscheme zenburn`. Lualine's `auto` theme resolves it too.

Options
-------

Set `vim.g.zenburn` before loading, or call `require("zenburn").setup{}`.

```lua
vim.g.zenburn = {
  transparent_background = false,
  bold = true,            -- false strips bold from every group
  dim_inactive = false,   -- NormalNC on the gutter background
  terminal_colors = true, -- vim.g.terminal_color_0..15
  plugins = {
    auto = true,          -- detect installed plugins through lazy.nvim
    all = false,          -- apply every plugin file
    snacks = false,       -- disable one file (or by plugin name)
  },
  overrides = {           -- table merged last, or function(groups, colors)
    Comment = { fg = "#7f9f7f" },
  },
}
```

Structure
---------

```
lua/zenburn/palette.lua        hex values, each with its IntelliJ attribute
lua/zenburn/theme.lua          roles (ui.*, syn.*, diag.*, git.*, diff.*)
lua/zenburn/highlights/*.lua   one file per plugin, roles only
lua/zenburn/highlights/init.lua  plugin name -> file map
scripts/check-parity.lua       headless check against the SPEC table
scripts/render.lua             treesitter render of a file to HTML
```

Check parity after a change (needs nothing but Neovim):

```sh
nvim --headless --clean --cmd 'set rtp+=.' -l scripts/check-parity.lua
```

Render a file with the theme to compare against IntelliJ:

```sh
nvim --headless --clean \
  --cmd 'set rtp+=.,~/.local/share/nvim/lazy/nvim-treesitter,~/.local/share/nvim/lazy/nvim-treesitter/runtime' \
  -l scripts/render.lua path/to/File.java out.html 1 80
```

License
-------

MIT, see `LICENSE.txt`. The IntelliJ scheme files under `reference/intellij`
keep their own MIT license.
