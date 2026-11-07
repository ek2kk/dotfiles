# Git

Конфигурация: [`config`](./config). Редактор коммитов — `nvim`; ветка по
умолчанию — `main`; `pull` использует merge, а не rebase.

- `zdiff3` для merge conflicts и `histogram` для diff.
- Автоконвертация line endings: `input`; включены `preloadindex` и compression `9`.
- Aliases: `st` (`status -sb`), `co`, `br`, `ci`, `lg` (graph log).
- Git LFS включён через filter `lfs`.
- Diff показывает [delta](https://github.com/dandavison/delta), тема `ansi` (цвета терминала).
  Без установленного `git-delta` команды с pager выдадут ошибку.

[`ignore`](./ignore) — глобальный список игнорируемых файлов, Git читает его сам.
