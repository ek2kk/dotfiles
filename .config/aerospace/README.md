# AeroSpace

Конфигурация: [`aerospace.toml`](./aerospace.toml). AeroSpace стартует при
логине и автоматически перечитывает изменения файла.

## Layout и окна

| Бинд | Действие |
| --- | --- |
| `Alt-E` | Переключить layout: tiles → horizontal → vertical |
| `Alt-Shift-Space` | Переключить floating / tiling для текущего окна |
| `Alt-W` | Fullscreen |
| `Alt-H/J/K/L` | Сфокусировать окно слева / снизу / сверху / справа |
| `Alt-Shift-H/J/K/L` | Переместить окно в соответствующую сторону |
| `Alt--` / `Alt-=` | Уменьшить / увеличить размер окна |

По умолчанию используется tiling; внутренние и внешние gaps — `12px`,
`accordion-padding` — `24px`. Нормализация контейнеров включена, а скрытые
macOS-приложения автоматически показываются при фокусе.

## Workspaces

| Бинд | Действие |
| --- | --- |
| `Alt-1` … `Alt-7` | Перейти в workspace 1–7 |
| `Alt-Shift-1` … `Alt-Shift-7` | Переместить окно в workspace 1–7 и перейти туда |
| `Alt-Tab` | Вернуться к предыдущему workspace |
| `Alt-Shift-Tab` | Переместить текущий workspace на следующий монитор |

Workspaces `1–7` постоянные: пустые не скрываются. Workspaces `1–4` закреплены
за `main`, `5–7` — за `secondary` monitor.

## Запуск приложений

| Бинд | Действие |
| --- | --- |
| `Alt-B` | Workspace 1 и Zen |
| `Alt-F` | Finder |
| `Alt-Q` | Workspace 2 и WezTerm |
| `Alt-S` | Workspace 3 и LOOP |
| `Alt-T` | Workspace 3 и Telegram |
| `Alt-G` | Workspace 5 и ChatGPT |

## Service mode

Войти: `Alt-Shift-;`.

| Бинд | Действие |
| --- | --- |
| `Esc` | Reload config и вернуться в основной режим |
| `R` | Выровнять дерево текущего workspace |
| `F` | Переключить floating / tiling |
| `Backspace` | Закрыть все окна, кроме текущего |
| `Alt-Shift-H/J/K/L` | Присоединить окно к соседнему контейнеру |
| `↑` / `↓` | Громче / тише |
| `Shift-↓` | Mute и выход из service mode |

## Правила окон

- Finder, System Settings и V2Box открываются floating.
- Zen открывается в workspace 1.
- WezTerm и Zed — в workspace 2.
- LOOP и Telegram — в workspace 3.
- ChatGPT и Codex — в workspace 5.
