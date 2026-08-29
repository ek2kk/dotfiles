local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- General
config.font_size = 17
config.line_height = 1.2
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Symbols Nerd Font Mono",
})
config.color_scheme = "OneDark (base16)"

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.keys = {
	{ key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "w", mods = "SUPER|SHIFT", action = act.CloseCurrentTab({ confirm = false }) },
}

return config
