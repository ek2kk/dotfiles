# Neovim keymaps

`<leader>` = Space.
`<localleader>` = `\`.

Режимы:

- Normal - обычный режим.
- Insert - режим вставки.
- Visual - визуальный режим / выделение.

## База

| Клавиши | Режим | Что делает |
| --- | --- | --- |
| `<space><space>x` | Normal | Выполнить текущий Lua-файл через `:source %` |
| `<space>x` | Normal | Выполнить текущую строку как Lua |
| `<space>x` | Visual | Выполнить выделение как Lua |
| `<Esc>` | Normal | Убрать подсветку поиска |
| `<leader>d` | Normal | Открыть diagnostics текущего буфера в Snacks Picker |
| `jj` | Insert | Выйти в Normal mode |
| `<C-h>` | Normal | Перейти в окно слева |
| `<C-l>` | Normal | Перейти в окно справа |
| `<C-j>` | Normal | Перейти в окно снизу |
| `<C-k>` | Normal | Перейти в окно сверху |

Примечание: в буферах с подключенным LSP `<leader>d` перекрывается буферным маппингом и показывает диагностику строки.

## File explorer

Используется `Snacks.explorer`.

| Клавиши | Режим | Что делает |
| --- | --- | --- |
| `<D-e>` | Normal | Открыть / закрыть file explorer |
| `<leader>e` | Normal | Открыть file explorer |

`<D-e>` — Super/Command+E, если терминал или GUI Neovim передаёт эту клавишу внутрь Neovim.

## Snacks Picker

| Клавиши | Режим | Что делает |
| --- | --- | --- |
| `<leader>ff` | Normal | Найти файлы в текущей директории |
| `<leader>fr` | Normal | Найти недавно открытые файлы |
| `<leader>fs` | Normal | Поиск строки по проекту |
| `<leader>fc` | Normal | Поиск строки под курсором по проекту |
| `<leader>fk` | Normal | Открыть список keymaps |

## LSP

Эти маппинги работают в буферах, где подключился LSP.

| Клавиши | Режим | Что делает |
| --- | --- | --- |
| `gR` | Normal | Показать LSP references через Snacks Picker |
| `gD` | Normal | Перейти к declaration |
| `gd` | Normal | Перейти к definition |
| `gi` | Normal | Показать implementations через Snacks Picker |
| `gt` | Normal | Показать type definitions через Snacks Picker |
| `<leader>ca` | Normal, Visual | Code action |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>D` | Normal | Показать diagnostics текущего буфера в Snacks Picker |
| `<leader>d` | Normal | Показать диагностику строки |
| `[d` | Normal | Перейти к предыдущей diagnostic |
| `]d` | Normal | Перейти к следующей diagnostic |
| `K` | Normal | Показать hover-документацию |
| `<leader>rs` | Normal | Перезапустить LSP |

## Trouble

| Клавиши | Режим | Что делает |
| --- | --- | --- |
| `<leader>xw` | Normal | Открыть / закрыть workspace diagnostics |
| `<leader>xd` | Normal | Открыть / закрыть diagnostics текущего документа |
| `<leader>xq` | Normal | Открыть / закрыть quickfix list |
| `<leader>xl` | Normal | Открыть / закрыть location list |

## Completion

Используется `blink.cmp`.

| Клавиши | Режим | Что делает |
| --- | --- | --- |
| `<C-k>` | Insert | Предыдущее предложение автодополнения |
| `<C-j>` | Insert | Следующее предложение автодополнения |
| `<C-b>` | Insert | Прокрутить документацию вверх |
| `<C-f>` | Insert | Прокрутить документацию вниз |
| `<C-Space>` | Insert | Открыть меню автодополнения |
| `<C-e>` | Insert | Закрыть меню автодополнения |
| `<CR>` | Insert | Подтвердить выбранное completion-предложение |

## Formatting

| Клавиши | Режим | Что делает |
| --- | --- | --- |
| `<leader>mp` | Normal, Visual | Отформатировать файл или выделенный диапазон |

## Which-key и изображения

| Клавиши | Режим | Что делает |
| --- | --- | --- |
| `<leader>?` | Normal | Показать buffer-local keymaps через which-key |
| `<leader>p` | Normal | Вставить изображение из системного clipboard |
