# zenburn.nvim fork: IntelliJ-parity Zenburn for Neovim

Fork of [phha/zenburn.nvim](https://github.com/phha/zenburn.nvim) at commit
`f5ee12b` (2024-01-31). Upstream is a faithful Lua port of Jani Nurminen's
original Vim Zenburn. This fork re-targets it at the look of the **IntelliJ
Zenburn plugin** ([marketplace 17938](https://plugins.jetbrains.com/plugin/17938-zenburn),
source [smashedtoatoms/zenburn](https://github.com/smashedtoatoms/zenburn)),
which is the version I actually like, and then modernizes the plugin for
Neovim 0.12.

## 1. Why

- Same base palette on both sides (bg `#3f3f3f`, fg `#dcdccc`, keyword
  `#f0dfaf` bold, string `#cc9393`, selection `#4f4f4f`), but the IntelliJ
  author made deliberate departures from the Vim original and those are what
  make it feel calmer: functions are plain bold text instead of yellow,
  comments are darker, the caret row is *darker* than the background, braces
  match with a quiet teal bg, references under the cursor get a thin underline
  instead of a yellow IncSearch block.
- Upstream `treesitter.lua` still defines the pre-0.8 `TS*` groups. Neovim 0.12
  ignores them entirely, so today treesitter captures fall through
  `@capture -> legacy group` and the file does nothing.
- Upstream has no `@lsp.*` semantic-token groups, so the IntelliJ distinctions
  that live in semantic highlighting (field vs. local, static method, interface
  vs. class, annotation, constant) can't be expressed.
- Upstream covers plugins I don't use (hydra, symbols-outline, nvim-cmp) and
  misses the ones I do (blink.cmp, snacks, telescope, lualine, mini, flash).

## 2. Hard constraints (owner's eyes)

- Halation and blue-light sensitivity. Warm, low-contrast, light-on-dark only.
  Never introduce a blue the IntelliJ scheme does not already have
  (`#94bff3` numbers is the only real blue, and it stays because I'm used to it).
- **No italics. Anywhere. Ever.** Not for comments, not for statics, not for
  doc tags, not in plugin groups. Where IntelliJ uses italic as a cue (static
  members, doc comments, TODO), carry the cue with the IntelliJ *color* alone
  and drop the slant. Italic is a reading cost, not a highlight.
- Bold strokes bleed. Keep bold exactly where IntelliJ has it and nowhere
  else. Expose a `bold = false` option so I can turn all of it off in one place.
- No layout shift, no loud backgrounds: references, search and matched braces
  are *subtle* background or underline changes, as in IntelliJ.
- Source of truth for every color is `reference/intellij/zenburn.xml`
  (editor scheme, `parent_scheme="Darcula"`) and `reference/intellij/zenburn.theme.json`
  (UI theme). Where the XML sets no value, the attribute inherits Darcula,
  which for the groups we care about means "same as text" (`#dcdccc`).
  Where neither IntelliJ nor Darcula has an opinion, keep the Vim-original hex
  already in `lua/zenburn/palette.lua`.

## 3. Repo map (as forked)

```
colors/zenburn.lua              -> require("zenburn").setup()
lua/zenburn/init.lua            -> setup(): clears ns, sets bg/termguicolors,
                                   applies every table in highlights/init.lua,
                                   sets vim.g.colors_name = "zenburn.nvim"  (!)
lua/zenburn/palette.lua         -> flat table: legacy group -> {fg,bg,bold,...}
lua/zenburn/highlights/init.lua -> list of highlight tables to apply, in order
lua/zenburn/highlights/*.lua    -> core (= palette), diagnostic, lsp, treesitter
                                   (dead TS* groups), gitsigns, which-key, leap,
                                   indent_blankline, nvim-tree, nvim-cmp, trouble,
                                   neotest, hydra, symbols-outline
lua/lualine/themes/zenburn.lua  -> lualine theme (only found if lualine theme is
                                   literally "zenburn"; "auto" looks up
                                   colors_name, i.e. "zenburn.nvim", and misses)
reference/intellij/             -> the IntelliJ plugin's scheme files (MIT)
```

## 4. Dev loop

Neovim config lives in `~/.dotfiles/.config/nvim` (subtree of the dotfiles
repo, branch `dots-subtree`).

- Active theme: `theme_name` in `lua/user/config/init.lua` (currently `'zenburn'`).
  `lua/user/plugins/themes/init.lua` only returns the spec for the active theme,
  so inactive themes are never installed; `Lazy install` also prunes their
  lock entries.
- Plugin spec: `lua/user/plugins/themes/zenburn.lua`, repo string in
  `lua/user/plugins/utils/plugin_repos.lua` (`gipo355/zenburn.nvim`).
  lazy.nvim `dev.path` is `~/Programming/CURRENT` with `fallback = true`, so
  this clone is loaded directly when it exists and the GitHub fork otherwise.
- Reload after an edit: `:Lazy reload zenburn.nvim` then `:colorscheme zenburn`,
  or just restart. `:Inspect` on a token shows the treesitter capture, the
  `@lsp.*` token and the final group. `:hi <Group>` shows the resolved value.
- Headless parity check (run from the config dir):

  ```sh
  nvim --headless -c 'lua for _,g in ipairs{"Normal","Keyword","String","Function","Comment","Number","CursorLine","Visual","MatchParen","LspReferenceText"} do local h=vim.api.nvim_get_hl(0,{name=g}); print(g, h.fg and ("%06x"):format(h.fg), h.bg and ("%06x"):format(h.bg), h.bold, h.underline) end' -c qa
  ```

  Turn this into `scripts/check-parity.lua` driven by a table (section 6) so
  the result is a diff, not eyeballing.
- Visual check: open the same Java and TypeScript file in IntelliJ and Neovim
  side by side (Java: fields, static method, interface, annotation, constant,
  javadoc with `@param`; TS: decorator, interface, enum, template string).

## 5. IntelliJ attribute table (from `reference/intellij/zenburn.xml`)

`FONT_TYPE`: 1 = bold, 2 = italic, 3 = bold italic. `EFFECT_TYPE` 1 =
underline, 2 = undercurl, 5 = none.

### Editor chrome

| IntelliJ                          | value                | Neovim target                                            |
|-----------------------------------|----------------------|----------------------------------------------------------|
| TEXT                              | fg dcdccc bg 3f3f3f  | Normal                                                   |
| CARET_ROW_COLOR                   | 303030               | CursorLine (darker than bg; upstream uses lighter 434443) |
| CARET_COLOR                       | dcdccc               | Cursor                                                   |
| SELECTION_BACKGROUND              | 4f4f4f               | Visual (upstream green 233323 goes away)                 |
| LINE_NUMBERS_COLOR                | 656555               | LineNr                                                   |
| GUTTER_BACKGROUND                 | 383838               | LineNr bg, SignColumn, FoldColumn                        |
| VISUAL_INDENT_GUIDE               | 383838               | indent guide group (indentmini / IblIndent)              |
| TEARLINE_COLOR                    | 4f4f4f               | FoldColumn fg / Folded                                   |
| METHOD_SEPARATORS_COLOR           | 5f5f5f               | WinSeparator (upstream orange dfaf8f goes away)          |
| TOOLTIP / NOTIFICATION_BACKGROUND | 5f5f5f               | NormalFloat / FloatBorder bg, Pmenu bg                   |
| DOCUMENTATION_COLOR               | 2b2b2b               | LSP hover float bg (consider for NormalFloat instead)    |
| CONSOLE_BACKGROUND_KEY            | 303030               | terminal buffer Normal, if we special-case it            |
| MODIFIED_LINES_COLOR              | 415f69               | GitSignsChange                                           |
| IGNORED_ADDED_LINES_BORDER_COLOR  | 7f9f7f               | GitSignsAdd                                              |
| SEARCH_RESULT_ATTRIBUTES          | bg 3a3a3a            | Search (occurrences)                                     |
| TEXT_SEARCH_RESULT_ATTRIBUTES     | bg 425f44            | IncSearch / CurSearch                                    |
| MATCHED_BRACE_ATTRIBUTES          | bg 3b514d bold       | MatchParen (and vim-matchup MatchWord)                   |
| MATCHED_TAG_NAME                  | fg 5c888b underline  | MatchParen for tags / nvim-ts-autotag                    |
| IDENTIFIER_UNDER_CARET            | underline sp 5f7f5f  | LspReferenceText / Read / Write (upstream = IncSearch)   |
| INLINE_PARAMETER_HINT*            | fg aaa9a9 bg 505050  | LspInlayHint                                             |
| CTRL_CLICKABLE                    | fg 94bff3 underline  | @markup.link.url, Underlined                             |
| BREAKPOINT_ATTRIBUTES             | bg 8c5353            | DapBreakpoint line                                       |
| EXECUTIONPOINT_ATTRIBUTES         | bg 94bff3            | DapStopped line (too loud? verify in IJ first)           |
| ERRORS_ATTRIBUTES                 | undercurl e81a1a     | DiagnosticUnderlineError                                 |
| WARNING_ATTRIBUTES                | undercurl f0dfaf     | DiagnosticUnderlineWarn                                  |
| INFO_ATTRIBUTES                   | undercurl d0bf8f     | DiagnosticUnderlineInfo / Hint                           |
| TYPO                              | undercurl dcdccc     | SpellBad                                                 |
| INJECTED_LANGUAGE_FRAGMENT        | bg 5f7f5f            | probably ignore; check how it looks in IJ                |

### Syntax

| IntelliJ                       | value                      | Neovim target                                                      |
|--------------------------------|----------------------------|--------------------------------------------------------------------|
| DEFAULT_KEYWORD                | f0dfaf bold                | Keyword and every @keyword.* (IJ has ONE keyword color; upstream splits Conditional/Repeat/Include/Exception/StorageClass into different warm hues, unify them) |
| DEFAULT_STRING                 | cc9393                     | String, @string, @string.regexp, Character                         |
| DEFAULT_VALID_STRING_ESCAPE    | ac7373 bold                | @string.escape, SpecialChar                                        |
| DEFAULT_INVALID_STRING_ESCAPE  | cc867e undercurl ff0000    | @string.escape.invalid? skip, or Error link                        |
| DEFAULT_NUMBER                 | 94bff3                     | Number, Float, @number, @number.float                              |
| (Boolean = keyword in Java)    | f0dfaf bold                | Boolean, @boolean                                                  |
| DEFAULT_LINE_COMMENT           | 5f7f5f                     | Comment, @comment                                                  |
| DEFAULT_BLOCK_COMMENT          | 5f7f5f italic              | Comment (drop italic)                                              |
| DEFAULT_DOC_COMMENT            | 5f7f5f bold                | @comment.documentation, @string.documentation (bold on a whole javadoc block is a lot; verify in IJ, candidate for the bold toggle) |
| DEFAULT_DOC_COMMENT_TAG        | 6ca0a3 bold italic, underline 526d4a | @keyword.directive in doc comments / javadoc `@param`: 6ca0a3 bold, no italic, no underline |
| DEFAULT_DOC_COMMENT_TAG_VALUE  | bfebbf italic              | @variable.parameter inside doc comments: bfebbf, no italic         |
| DEFAULT_DOC_MARKUP             | 9fc59f                     | @markup.raw in doc comments                                        |
| TODO_DEFAULT_ATTRIBUTES        | 7f9f7f italic              | Todo, @comment.todo, @comment.note: 7f9f7f, no italic              |
| DEFAULT_IDENTIFIER             | dcdccc                     | Identifier, @variable, @variable.parameter (Darcula default)       |
| DEFAULT_FUNCTION_CALL          | dcdccc bold                | @function.call, @function.method.call                              |
| DEFAULT_FUNCTION_DECLARATION   | bold (fg inherits = dcdccc)| Function, @function, @function.method, @constructor                |
| DEFAULT_STATIC_METHOD          | 8acdd0 italic              | @lsp.typemod.method.static, @lsp.typemod.function.static: 8acdd0, NO italic (color is the cue) |
| DEFAULT_CLASS_NAME             | 6ca0a3                     | Type, @type, @type.definition, @lsp.type.class, @lsp.type.enum, @lsp.type.struct |
| DEFAULT_CLASS_REFERENCE        | 366060                     | SUSPICIOUS: very dark teal. Check in IJ whether class refs really render this dark before copying. If not, treat refs = CLASS_NAME |
| DEFAULT_INTERFACE_NAME         | 7cb8bb                     | @lsp.type.interface, @lsp.type.typeParameter?                      |
| DEFAULT_CONSTANT               | d6d6ae bold                | Constant, @constant, @lsp.typemod.variable.static.readonly, @lsp.type.enumMember |
| DEFAULT_GLOBAL_VARIABLE        | d6d6ae bold                | @variable.builtin? (Lua globals) / @lsp.typemod.variable.global    |
| DEFAULT_INSTANCE_FIELD         | dfaf8f bold                | @variable.member, @property, @lsp.type.property                    |
| DEFAULT_STATIC_FIELD           | dfaf8f                     | @lsp.typemod.property.static (no bold)                             |
| DEFAULT_METADATA               | 6ca0a3                     | @attribute, @attribute.builtin, @lsp.type.decorator (annotations)  |
| DEFAULT_TAG                    | b6b6a7                     | @tag, @tag.builtin, Tag                                            |
| DEFAULT_ATTRIBUTE              | dfaf8f bold                | @tag.attribute                                                     |
| DEFAULT_ENTITY                 | dcdccc bold                | @character.special in markup                                       |
| DEFAULT_TEMPLATE_LANGUAGE_COLOR| 93e0e3                     | @punctuation.special (template `${}`)                              |
| DEFAULT_OPERATION_SIGN         | unset -> Darcula -> text   | Operator, @operator, @keyword.operator: dcdccc, NOT upstream f0efd0|
| DEFAULT_BRACES / PARENTHESES   | unset -> text              | @punctuation.bracket dcdccc (upstream Delimiter 8f8f8f goes away; rainbow_delimiters stays optional) |
| DEFAULT_PARAMETER              | unset -> text              | @variable.parameter dcdccc                                         |
| DEFAULT_LOCAL_VARIABLE         | unset -> text              | @variable dcdccc                                                   |

Treesitter capture names are the Neovim 0.10+ set (`@variable.member`,
`@function.method.call`, `@keyword.conditional`, `@markup.*`, ...). Semantic
tokens use `@lsp.type.<type>`, `@lsp.mod.<mod>` and
`@lsp.typemod.<type>.<mod>`; the `typemod` forms are what give IntelliJ's
field/static/constant distinctions.

### What the real IntelliJ rendering shows (Java, synergy3 email-servers, 2026-10-06)

Confirmed against a live screenshot, which the XML alone doesn't make obvious:

- Keywords (`public class extends protected return void var if else null`)
  are all the same pale yellow bold. One keyword color, no sub-shades.
- Method declarations AND method calls are text-colored bold. Nothing is yellow.
- Class and type names (`EmailServer`, `WriteBatchDao`, `Class`) teal `6ca0a3`.
  `@Override` is the same teal.
- Static members are italic in IntelliJ: `EmailServerField.TIMEOUT_MS`,
  `DEFAULT_TIMEOUT_MS` (constants, pale `d6d6ae`),
  `SymmetricEncryptionHandler.encrypt`, `Message.missingHost` (static method,
  `8acdd0`). We do NOT copy the italic (section 2). The colors alone mark
  static-ness: map `d6d6ae` and `8acdd0` to `@lsp.typemod.*.static` and
  verify they stay distinguishable from text and from class teal without
  the slant. If `d6d6ae` vs `dcdccc` is too close in practice, that's the one
  place allowed to deviate from IntelliJ (candidate: `#d0bf8f`, already in the
  scheme as INFO color).
- Parameters and locals (`entity`, `timeout`) are plain text color.
- Comments are the dark green `5f7f5f`, clearly dimmer than code.
- Parentheses and brackets render dimmer than text. The XML doesn't set
  `DEFAULT_PARENTHS`/`BRACKETS`, so this is Darcula's inherited value or a
  plugin: verify in IJ (Settings > Editor > Color Scheme > Language Defaults
  > Braces and Operators) before choosing between `dcdccc` and upstream's `8f8f8f`.
- Caret row is darker than the background, relative line numbers in `656555`,
  current line number brighter.
- Project tree selection is a muted green-gray block; that's the UI theme, out
  of scope except as inspiration for `Visual`/picker selection (`4f4f4f`).

## 5b. Architecture inspiration (modern Neovim themes)

Steal structure, not colors. Reference implementations worth reading before
phase 0:

- **tokyonight.nvim** (folke): `colors/` palette per style, `groups/` one file
  per plugin, `groups/init.lua` auto-detects installed plugins via lazy.nvim
  and only applies those; byte-cached compiled highlights for startup;
  `on_colors`/`on_highlights` hooks; `extras/` generators for kitty, tmux,
  fish, etc. The plugin-detection + cache pattern is the one to copy.
- **catppuccin/nvim**: `integrations = { blink_cmp = true, ... }` table with
  per-plugin files under `lua/catppuccin/groups/integrations/`, `custom_highlights`,
  `styles = { comments = { "italic" }, keywords = { "bold" } }` lets users
  turn styles off per category. Match the shape for the `bold` option only.
- **kanagawa.nvim**: clean split between `palette` (named hex) and `theme`
  (semantic roles: `syn.keyword`, `ui.bg_gutter`, `diag.error`), groups only
  reference theme roles. Do the same: `palette.lua` = hex, `theme.lua` =
  roles, `highlights/*` = groups.
- **rose-pine/neovim**: `highlight_groups` override that accepts role names
  (`fg = "muted"`) as well as hex; `dim_inactive_windows`,
  `extend_background_behind_borders` flags.
- **gruvbox-material** (sainnhe): the model for low-contrast "material" soft
  variants and for how to tune diagnostics so they don't shout (`diagnostic_text_highlight`
  off, virtual text dimmed). Also the owner's everyday theme elsewhere; keep
  float and picker behaviour familiar to it.

Keep the plugin single-purpose: one dark style, no light, no 10 variants.

## 6. Work plan

Each phase is one PR-sized unit, verified before the next starts. Commit per
phase, imperative subject.

### Phase 0: scaffolding

- Restructure as palette.lua (hex) / theme.lua (roles) / highlights/<plugin>.lua,
  applied only for plugins present in `package.loaded` or lazy's plugin list
  (tokyonight pattern). Keep `require("zenburn").setup()` as the entry.

- `vim.g.colors_name = "zenburn"` (not `"zenburn.nvim"`) so lualine `auto`,
  `:colorscheme` echo and anything keyed on `colors_name` resolve.
- `setup(opts)` accepting `{ transparent_background = false, bold = true,
  overrides = {} }`. No `italic` option: the plugin never emits `italic`,
  and `check-parity.lua` fails if any group has it. `bold = false` strips
  `bold` from every group; `overrides` is merged last. Default call from `colors/zenburn.lua`
  reads `vim.g.zenburn` so lazy `config` can stay a one-liner, matching how
  zenbones is configured in my dotfiles.
- `scripts/check-parity.lua`: table of `{group, fg, bg, bold, italic,
  underline, undercurl, sp}` built from section 5, run headless, prints
  mismatches, exits non-zero. This is the done-criterion for phase 1.
- Drop `highlights/hydra.lua`, `symbols-outline.lua`, `nvim-cmp.lua` from the
  load list (keep files, disable; they're references).

### Phase 1: palette parity

Apply every row of section 5 to `palette.lua` and a new
`highlights/treesitter.lua` (rewritten with `@` captures) and
`highlights/lsp.lua` (with `@lsp.*`). Resolve the two SUSPICIOUS rows by
looking at IntelliJ first. Done when `check-parity.lua` is green and the
side-by-side Java/TS screenshots match.

### Phase 2: plugin coverage for my stack

Groups for, in priority order: blink.cmp (menu, selection, kind icons, doc,
signature), snacks (picker, notifier, indent, dashboard, input), telescope,
lualine theme (sections built from the chrome table: normal bg `383838`,
insert `#7f9f7f`, visual `#4f4f4f`, replace `#cc9393`), which-key, gitsigns,
flash, nvim-treesitter-context, render-markdown, lspsaga + lsp_signature,
nvim-tree + oil, noice/nui, neotest, nvim-dap (+ virtual text), trouble/outline,
fidget, diffview + neogit + git-conflict, satellite, indentmini,
rainbow-delimiters (warm hues only: the keyword/field/constant/type colors
above, no new blues), mini.*, matchup, multicursor/visual-multi, yanky,
tiny-glimmer, grug-far/spectre. Avante/codecompanion/copilot/sidekick last.
Check each plugin's `:help <plugin>-highlights` for the real group names.

### Phase 3: polish beyond IntelliJ

- `vim.g.terminal_color_0..15` from the Zenburn ANSI palette.
- Diagnostic virtual text and signs in the undercurl colors but dimmed
  (IntelliJ draws only undercurls inline; the gutter icons are tiny). Don't
  paint whole lines.
- Float borders: `5f5f5f` on `3f3f3f`, no bg change behind borders.
- Optional `dim_inactive` (NormalNC `383838`) behind a flag, default off
  (layout stability: bg change only, never width).
- README: credit upstream and the IntelliJ plugin, document options, add a
  screenshot taken next to IntelliJ.

## 7. Non-goals

- Light variant.
- Supporting Vim or Neovim < 0.10.
- Matching IntelliJ's UI theme (`zenburn.theme.json`) beyond float/menu
  backgrounds; the editor scheme is what matters.
- Keeping upstream's `TS*` groups or `hydra`/`symbols-outline` support.

## 8. Decisions so far

- 2026-10-06: forked phha/zenburn.nvim rather than writing a zenbones
  `zenburned` override or an IntelliJ-ish override layer in the dotfiles. The
  palette, group structure and lualine theme are reusable; the treesitter and
  LSP layers need a rewrite anyway, which is cleaner in the plugin than in
  config.
- Upstream commit pinned at `f5ee12b`; no intention to upstream, the goal is
  a different look.
