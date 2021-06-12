local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

local M = {}

M.widget = wibox.widget.systray({ forced_height = dpi(27), base_size = dpi(20) })

return M
