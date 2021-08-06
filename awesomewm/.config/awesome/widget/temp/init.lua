local wibox = require("wibox")
local awful = require("awful")
local colorize = require("utils.function").colorize
local beautiful = require("beautiful")
local markup = require("utils.function").markup

local M = {}
local icon = os.getenv("HOME") .. "/.config/awesome/widget/temp/icon.svg"

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local get_temp_status = [[
    sh -c "
    sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp
    "
]]

M.widget = awful.widget.watch(get_temp_status, 5, function(widget, stdout)
    widget:set_markup(markup(stdout, { fg = beautiful.widget_text }))
end)

return M
