local utils = require 'utils'
local listeners = require 'listeners'

listeners.listen()

local modules = utils.map({
   'window',
   'font',
   'theme',
   'tab'
}, utils.req)

return utils.merge(table.unpack(modules))
