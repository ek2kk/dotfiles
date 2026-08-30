# Git

Конфигурация: [`config`](./config). Редактор коммитов — `nvim`; ветка по
умолчанию — `main`; `pull` использует merge, а не rebase.

- `zdiff3` для merge conflicts и `histogram` для diff.
- Автоконвертация line endings: `input`; включены `preloadindex` и compression `9`.
- Aliases: `st` (`status -sb`), `co`, `br`, `ci`, `lg` (graph log).
- Git LFS включён через filter `lfs`.

Локальные credential helpers для `origin.cursor.com` также определены в этом
файле.
