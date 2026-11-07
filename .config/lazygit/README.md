# lazygit

Конфигурация: [`config.yml`](./config.yml).

- Diff показывает `delta` с настройками из [`../git/config`](../git/config).
- `autoFetch: false`: lazygit не обращается к remote сам.

На macOS lazygit по умолчанию читает `~/Library/Application Support/lazygit`,
поэтому `.zshenv` задаёт путь через `LG_CONFIG_FILE`.
