local wezterm = require("wezterm")
local config = {}

config.automatically_reload_config = true

config.font = wezterm.font("0xProto Nerd Font Mono")
config.font_size = 15.0
config.use_ime = true
config.window_decorations = "RESIZE"
-- config.show_tabs_in_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	font_size = 15.0,
}

config.window_background_opacity = 0.7
-- config.text_background_opacity = 0.7

-- Leader Key (Ctrl + n)
config.leader = { key = "n", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = nil
				overrides.text_background_opacity = nil
			else
				overrides.window_background_opacity = 1.0
				overrides.text_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			local overrides = window:get_config_overrides() or {}
			local current_opacity = overrides.window_background_opacity or 0.7
			local new_opacity = current_opacity + 0.1
			if new_opacity > 1.0 then
				new_opacity = 1.0
			end
			overrides.window_background_opacity = new_opacity
			overrides.text_background_opacity = new_opacity
			window:set_config_overrides(overrides)
		end),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			local overrides = window:get_config_overrides() or {}
			local current_opacity = overrides.window_background_opacity or 0.7
			local new_opacity = current_opacity - 0.1
			if new_opacity < 0.1 then
				new_opacity = 0.1
			end
			overrides.window_background_opacity = new_opacity
			overrides.text_background_opacity = new_opacity
			window:set_config_overrides(overrides)
		end),
	},
}

return config
