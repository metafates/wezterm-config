local wezterm = require 'wezterm'

local font_size = 18
local bold = true
local font_family = ({
   'Iosevka Nerd Font Mono', -- [1]
   'JetBrainsMono Nerd Font', -- [2]
   'FiraCode Nerd Font Mono', -- [3]
   'Photonico Code', -- [4]
   'VictorMono Nerd Font', -- [5]
   'Hurmit Nerd Font Mono', -- [6]
   'Gintronic', -- [7]
   'Monocraft', -- [8]
   'Comic Mono', -- [9]
   'Input Mono', -- [10]
   'Comic Code', -- [11]
})[11]

local options = {}
if bold then
   options['weight'] = 'Bold'
end

local font = wezterm.font(font_family, options)

return {
   font      = font,
   font_size = font_size,
}
