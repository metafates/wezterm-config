local M = {}

local wezterm = require 'wezterm'
local status = require 'status'

local listeners = {
   ['update-right-status'] = status.update_right_status,
}

--- Starts all listeners
function M.listen()
   for event, handler in pairs(listeners) do
      wezterm.on(event, handler)
   end
end

return M
