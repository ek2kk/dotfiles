# dotfiles

Персональная macOS-конфигурация: shell, terminal, window manager и редактор.

## Состав

- `.zshenv`, `.zprofile`, `.zshrc` — Zsh, Homebrew, OrbStack, aliases, `zoxide`, `fzf` и плагины;
- `.config/starship.toml` — prompt Starship в палитре Catppuccin Mocha;
- `.config/ghostty/config` и `.config/wezterm/wezterm.lua` — терминалы Ghostty и WezTerm;
- `.config/aerospace/aerospace.toml` — tiling window manager AeroSpace и hotkeys;
- `.config/fastfetch/config.jsonc` — system info в терминале;
- `.config/git/config` — Git aliases и defaults;
- `.config/nvim` — Neovim-конфигурация с `lazy.nvim`.

Детальное описание каждой конфигурации — в [`.config/README.md`](./.config/README.md).

## Zsh

`.zshenv` добавляет `~/.local/bin` в `PATH`, инициализирует Homebrew и
OrbStack. `.zshrc` использует `nvim` как `EDITOR`/`VISUAL`, locale `en_US.UTF-8`
и хранит до 50 000 записей истории с дедупликацией, immediate append и shared
history между shell-сессиями.

### Completion и prompt

- `compinit`, completion menu, case-insensitive matching и completion внутри слова.
- Prompt — Starship из [`.config/starship.toml`](./.config/starship.toml):
  Catppuccin Mocha, Git/Python/Node/Rust/Go/Docker context и длительность команд
  от `500ms`.
- Включены `zsh-autosuggestions` и `zsh-syntax-highlighting`.

### Навигация и FZF

`zoxide` заменяет `cd`: можно использовать `z <часть-пути>` для перехода к
часто посещаемым каталогам. `fzf` использует `fd`, ищет в скрытых файлах и
исключает `.git`.

| Бинд | Действие |
| --- | --- |
| `Ctrl-R` | Fuzzy search по истории команд |
| `Ctrl-T` | Выбрать файл или каталог и вставить путь в командную строку |
| `Option-C` | Выбрать каталог и перейти в него |

Используется стандартный `emacs` keymap (`bindkey -e`), поэтому Vim command
mode по `Esc` отключён. `Option-C` намеренно не назначен в AeroSpace, чтобы
оставаться доступным для `fzf`.

### Aliases и defaults

- Files: `l`, `ls`, `ll`, `la`, `tree` через `eza`. Для улучшенных аналогов
  используйте их нативные имена: `bat`, `rg`, `fd`; стандартные `cat`, `grep`
  и `find` не переопределяются.
- Навигация: `..`, `...`, `....`; `c` — clear, `h` — history, `reload` —
  перечитать `.zshrc`, `v` — `nvim`.
- Git: `g`, `gs`, `ga`, `gaa`, `gc`, `gcm`, `gp`, `gpl`, `gb`, `gco`, `gd`, `gl`.
- Python: `py` → `python3`, `activate` активирует `.venv`; `gpu` выводит версии
  PyTorch и доступность CUDA/MPS. Установлены `PYTHONDONTWRITEBYTECODE=1`,
  `PYTHONUNBUFFERED=1` и `UV_LINK_MODE=copy`.
- `LESS=-R`, `BAT_THEME=TwoDark`; локальные изменения можно держать в
  `~/.zshrc.local` — он загружается последним.

## Установка

Склонировать репозиторий и создать симлинки:

```sh
git clone <repo-url> ~/dotfiles
ln -sfn ~/dotfiles/.zshenv ~/.zshenv
ln -sfn ~/dotfiles/.zprofile ~/.zprofile
ln -sfn ~/dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.config
ln -sfn ~/dotfiles/.config/{aerospace,fastfetch,ghostty,git,nvim} ~/.config/
ln -sfn ~/dotfiles/.config/{starship.toml,wezterm} ~/.config/
exec zsh -l
```

Конфигурация ожидает установленные через Homebrew утилиты:

```sh
brew install aerospace bat eza fastfetch fd fzf ghostty ripgrep starship wezterm zoxide zsh-autosuggestions zsh-syntax-highlighting
```

Опционально: `python3`, `uv`, `nvim`, `torch` (для alias `gpu`), OrbStack и файл `~/.zshrc.local` для локальных переопределений. Для Git измените `user.name` и `user.email` в `.config/git/config` на свои.

## Проверка

```sh
zsh -lic 'command -v starship eza bat rg fd fzf zoxide'
fastfetch
```
