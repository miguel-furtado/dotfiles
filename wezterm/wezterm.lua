local wezterm = require("wezterm")
local config = {}

config.hide_tab_bar_if_only_one_tab = true
config.font_size = 13
config.initial_rows = 32
config.initial_cols = 95
config.harfbuzz_features = { "calt=0" } --disable font ligatures
config.enable_wayland = false
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_rate = 600

wezterm.on("gui-startup", function(cmd) -- set startup Window position
	local tab, pane, window = wezterm.mux.spawn_window(cmd or { position = { x = 40, y = 60 } })
end)

config.keys = {}
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

if wezterm.gui.get_appearance() == "Dark" then
	config.color_scheme = "Xterm"
--	config.color_scheme = "Dracula"
else
	config.color_scheme = "Alabaster"
end

return config
