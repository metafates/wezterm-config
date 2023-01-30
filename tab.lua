local wezterm = require 'wezterm'
local utils = require 'utils'

--- @type table<number, string>
local tab_icons = {}

local function ansi(c)
   return { AnsiColor = c }
end

local function css(c)
   return { Color = c }
end

local icon_variants = utils.map({
   { 'cod_telescope', ansi('Teal') },
   'dev_coda',
   'dev_onedrive',
   'fa_bath',
   'fa_bug',
   'fa_eye',
   'fa_flask',
   'fa_fort_awesome',
   'fa_magic',
   { 'fa_magnet', ansi('Grey') },
   'fa_microchip',
   'fa_plane',
   'fa_snowflake_o',
   'fa_subway',
   { 'fa_usd', css('#118C4F') },
   'fae_apple_fruit',
   'fae_biohazard',
   'fae_carot',
   { 'fae_cherry', ansi('Red') },
   { 'fae_crown', css('#ffd700') },
   'fae_comet',
   'fae_dna',
   'fae_donut',
   'fae_ice_cream',
   'fae_popcorn',
   'fae_poison',
   'fae_planet',
   'fae_ruby',
   { 'fae_tooth', ansi('White') },
   { 'linux_ferris', css('#F13408') },
   { 'mdi_basketball', css('#F88158') },
   { 'mdi_clover', css('#3EA055') },
   { 'mdi_currency_eth', ansi('Aqua') },
   { 'mdi_ghost', ansi('White') }
}, function(i)
   if type(i) == 'string' then
      return wezterm.nerdfonts[i]
   end

   if type(i) == 'table' then
      return wezterm.format {
         { Foreground = i[2] },
         { Text = wezterm.nerdfonts[i[1]] },
      }
   end

   error('unexpected type')
end)

wezterm.on(
   'format-tab-title',
   function(tab)
      -- start indexing tabs from 1
      local index = tab.tab_index + 1
      local padding = '  '
      local id = tab.tab_id

      if tab_icons[id] == nil then
         tab_icons[id] = icon_variants[math.random(#icon_variants)]
      end

      local icon = tab_icons[id]
      return padding .. icon .. ' ' .. index .. padding
   end
)


return {
   use_fancy_tab_bar = false,
   tab_bar_at_bottom = true,
   show_new_tab_button_in_tab_bar = false,
}
