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
