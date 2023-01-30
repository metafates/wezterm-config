--- @alias battery_state 'Charging' | 'Discharging' | 'Empty' | 'Full' | 'Unknown'
--- @alias battery { state: battery_state, state_of_charge: number }

local M = {}

local wezterm = require 'wezterm'

--- @param battery battery state of charge, from 0.00 to 1.00
--- @return string
local function render_battery(battery)
   --- @type table<string, string>
   local icons = wezterm.nerdfonts

   local prefix = 'mdi_battery'
   if battery.state == 'Charging' then
      prefix = prefix .. '_charging'
   end

   local percent = battery.state_of_charge
   local icon = prefix .. '_' .. math.max(1, math.ceil(percent * 10)) .. '0'

   return icons[icon] .. ' ' .. string.format('%.0f%%', percent * 100)
end

function M.update_right_status(window)
   -- "Wed Mar 3 08:14"
   --- @type string
   local date = wezterm.strftime '%a %b %-d %H:%M'

   --- @type string
   local tilde = wezterm.format {
      { Foreground = { AnsiColor = 'Fuchsia' } },
      { Text = '~' }
   }

   --- @type string
   local battery

   for _, b in ipairs(wezterm.battery_info()) do
      battery = render_battery(b)
   end

   local status = battery .. ' ' .. tilde .. ' ' .. date .. ' '
   window:set_right_status(status)
end

return M
