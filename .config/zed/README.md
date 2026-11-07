# Zed

Конфигурация: [`settings.json`](./settings.json).

- Включён Vim mode.
- Отключены мигание курсора и перетаскивание выделенного текста.
- Панель проекта не открывается автоматически; поиск файлов использует широкое окно.
- Скрыт onboarding banner в заголовке окна.
- Отключены diagnostics, metrics и anthropic retention в telemetry.
- Размер шрифта интерфейса — 16, редактора — 15.
- Тема следует системной: One Light / One Dark.

## Подключение

Подключайте только `settings.json`: в `~/.config/zed` также могут находиться
темы и база промптов.

```sh
mkdir -p ~/.config/zed
# Если settings.json уже существует, сначала сохраните его под свободным именем:
# mv ~/.config/zed/settings.json ~/.config/zed/settings.json.bak
ln -s ~/dotfiles/.config/zed/settings.json ~/.config/zed/settings.json
```

Если репозиторий находится в другом месте, замените `~/dotfiles` на его путь.
После подключения изменения настроек через Zed будут попадать в dotfiles.
