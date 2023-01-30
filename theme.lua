local wezterm = require 'wezterm'

local dark_theme = ({
   'astromouse (terminal.sexy)', -- [1],
   'Catppuccin Frappe', -- [2]
   'rose-pine', -- [3], not working yet
   'Rosé Pine (base16)', -- [4]
   'WildCherry', -- [5]
   'nord', -- [6]
})[2]

local light_theme = ({
   'Catppuccin Latte', -- [1]
})[1]

local function scheme_for_appearance(appearance)
   if appearance:find 'Dark' then
      return dark_theme
   end

   return light_theme
end

wezterm.on('window-config-reloaded', function(window)
   local overrides = window:get_config_overrides() or {}
   local appearance = window:get_appearance()
   local scheme = scheme_for_appearance(appearance)
   if overrides.color_scheme ~= scheme then
      overrides.color_scheme = scheme
      window:set_config_overrides(overrides)
   end
end)

return {
   color_scheme = dark_theme
}
