
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
  'Menlo',
  'Hiragino Sans',
  'Hiragino Kaku Gothic ProN',
})


config.font_size = 14.0


config.line_height = 1.0


config.freetype_load_flags = 'NO_HINTING'
config.freetype_load_target = 'Light'


config.color_scheme = 'Tokyo Night'

config.window_background_opacity = 0.95

config.enable_tab_bar = true
config.use_fancy_tab_bar = true  
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false


config.window_decorations = 'TITLE | RESIZE'
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}


config.scrollback_lines = 10000


config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500


config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}


config.keys = {
  { key = 't', mods = 'CMD', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentTab { confirm = true } },


  { key = 'd', mods = 'CMD', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },


  { key = 'h', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down' },


  { key = '+', mods = 'CMD', action = wezterm.action.IncreaseFontSize },
  { key = '-', mods = 'CMD', action = wezterm.action.DecreaseFontSize },
  { key = '0', mods = 'CMD', action = wezterm.action.ResetFontSize },
}

return config
