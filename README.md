# dotfiles

Персональная macOS-конфигурация: shell, terminal, window manager и редактор.

## Состав

- `.zshenv`, `.zprofile`, `.zshrc` — Zsh, Homebrew, OrbStack, aliases, `zoxide`, `fzf` и плагины;
- `.config/starship.toml` — prompt Starship в палитре Kanagawa Dragon;
- `.config/ghostty/config` — терминал Ghostty;
- `.config/herdr/config.toml` — workspaces, вкладки и AI-агенты внутри терминала;
- `.config/aerospace/aerospace.toml` — tiling window manager AeroSpace и hotkeys;
- `.config/fastfetch/config.jsonc` — system info в терминале;
- `.config/git/config` — Git aliases и defaults;
- `.config/lazygit/config.yml` — lazygit с diff через delta;
- `.config/nvim` — Neovim-конфигурация с `lazy.nvim`;
- `.config/zed/settings.json` — настройки редактора Zed.

Детальное описание каждой конфигурации — в [`.config/README.md`](./.config/README.md).

## Zsh

`.zshenv` добавляет `~/.local/bin` в `PATH`, инициализирует Homebrew и
OrbStack. `.zshrc` использует `nvim` как `EDITOR`/`VISUAL`, locale `en_US.UTF-8`
и хранит до 50 000 записей истории с дедупликацией, immediate append и shared
history между shell-сессиями.

### Completion и prompt

- `compinit`, completion menu, case-insensitive matching и completion внутри слова.
- Prompt — Starship из [`.config/starship.toml`](./.config/starship.toml):
  Kanagawa Dragon, Git/Python/Node/Rust/Go/Docker context и длительность команд
  от `500ms`.
- Включены `zsh-autosuggestions` и `zsh-syntax-highlighting`.

### Навигация и FZF

`zoxide` заменяет `cd`: можно использовать `z <часть-пути>` для перехода к
часто посещаемым каталогам. `fzf` использует `fd`, ищет в скрытых файлах и
исключает `.git`.

| Бинд       | Действие                                                    |
| ---------- | ----------------------------------------------------------- |
| `Ctrl-R`   | Fuzzy search по истории команд                              |
| `Ctrl-T`   | Выбрать файл или каталог и вставить путь в командную строку |
| `Option-C` | Выбрать каталог и перейти в него                            |

Используется стандартный `emacs` keymap (`bindkey -e`), поэтому Vim command
mode по `Esc` отключён.

### Aliases и defaults

- Files: `l`, `ls`, `ll`, `la`, `tree` через `eza`. Для улучшенных аналогов
  используйте их нативные имена: `bat`, `rg`, `fd`; стандартные `cat`, `grep`
  и `find` не переопределяются.
- Навигация: `..`, `...`, `....`; `c` — clear, `h` — history, `reload` —
  перечитать `.zshrc`, `v` — `nvim`.
- Obsidian: `ov` — перейти в `ek-vault`, `on` — открыть vault в Neovim,
  `oo` — открыть vault в Obsidian.
- Git: `g`, `gs`, `ga`, `gaa`, `gc`, `gcm`, `gp`, `gpl`, `gb`, `gco`, `gd`, `gl`.
- Python: `py` → `python3`, `activate` активирует `.venv`; `gpu` выводит версии
  PyTorch и доступность CUDA/MPS. Установлены `PYTHONDONTWRITEBYTECODE=1`,
  `PYTHONUNBUFFERED=1` и `UV_LINK_MODE=copy`.
- `LESS=-R`, `BAT_THEME=ansi`; локальные изменения можно держать в
  `~/.zshrc.local` — он загружается последним.

## Установка

Склонировать репозиторий, поставить пакеты и создать симлинки:

```sh
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
brew bundle
./install.sh
exec zsh -l
```

`install.sh` можно запускать повторно. Существующие файлы он не удаляет, а
переименовывает в `*.bak.<timestamp>`. У Herdr и Zed подключается только файл
конфига, поскольку в их каталогах лежат и другие данные. Шрифт
[Obel Mono](https://typographic.systems/obel-mono) (SIL OFL) скрипт скачивает в
`~/Library/Fonts` и проверяет по SHA-256; установленный шрифт не обновляет.

Опционально: `torch` (для alias `gpu`) и файл `~/.zshrc.local` для локальных переопределений. Для Git измените `user.name` и `user.email` в `.config/git/config` на свои.

## Проверка

```sh
zsh -lic 'command -v starship eza bat rg fd fzf zoxide'
fastfetch
```
