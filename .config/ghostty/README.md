# Ghostty

Конфигурация: [`config`](./config).

- Font: `Obel Mono`, `14pt`; `ss01` скрывает секреты точками на экране, сам текст
  не меняется; cursor — block.
- Theme: `Atom One Dark`; непрозрачное окно с padding `10px`.
- `Cmd-T` открывает новую вкладку.
- `copy-on-select = true`; закрытие окна не запрашивает подтверждение.
- `macos-option-as-alt = left`: левый Option работает как Alt (например,
  `Option-C` для fzf в Zsh), правый по-прежнему вводит спецсимволы.
- `shell-integration-features = ssh-env,ssh-terminfo`: при `ssh` Ghostty ставит
  свой terminfo на сервер, а если не вышло, использует `xterm-256color`.

Закомментированный блок ниже theme содержит неактивную альтернативную палитру
True Black Catppuccin.
