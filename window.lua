local path = require 'path'

local use_background_image = false

local padding = 0
local window_padding = {
   left = padding,
   right = padding,
   top = padding,
   bottom = padding,
}

local M = {
   window_padding = window_padding,
   window_background_image_hsb = {
      brightness = 0.3
   },
   adjust_window_size_when_changing_font_size = false
}

if use_background_image then
   M.window_background_image = path.config .. '/background.png'
end

return M
