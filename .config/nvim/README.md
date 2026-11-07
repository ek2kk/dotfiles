# Neovim

Entry point: [`init.lua`](./init.lua). Плагины управляются `lazy.nvim` и при
первом запуске bootstrap-ятся автоматически. Полный перечень сочетаний — в
[`KEYMAPS.md`](./KEYMAPS.md).

## База

Для установки Prettier и Bash Language Server через Mason нужны Node.js и npm:

```sh
brew install node
```

Они должны быть доступны в `PATH` при запуске Neovim.

- Leader — `Space`, local leader — `\\`.
- Relative numbers, `4` spaces, clipboard `unnamedplus`, persistent undo,
  `scrolloff=10`, smart case search, splits вправо и вниз.
- `OneDark`, Treesitter, lualine и render-markdown.
- `Snacks`: explorer, picker, grep, dashboard и notifications.
- LSP через Mason: `lua_ls`, `ruff`, `ty`, `bashls`; completion — `blink.cmp`.
- Format on save: Prettier (JSON/YAML/Markdown), Stylua (Lua), Ruff (Python),
  shfmt (sh); `:ToggleFormatter` отключает его для текущего буфера.
- Общая строка статуса, постоянная sign column, скруглённые рамки всплывающих
  окон и фолды через Treesitter.

## Часто используемые бинды

| Бинд | Действие |
| --- | --- |
| `Space e` / `Cmd-E` | File explorer |
| `Space ff` | Найти файл |
| `Space fs` | Grep |
| `Space gg` | LazyGit (нужен `brew install lazygit`) |
| `Space gd` | CodeDiff: просмотр изменений Git |
| `Space d` | Diagnostics текущего buffer |
| `Space mp` | Форматировать файл или выделение |
| `Ctrl-H/J/K/L` | Перейти в соседний split |
| `Esc` | Снять подсветку поиска |
