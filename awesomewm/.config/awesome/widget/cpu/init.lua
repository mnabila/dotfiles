local wibox = require("wibox")
local awful = require("awful")
local colorize = require("utils.function").colorize
local markup = require("utils.function").markup
local beautiful = require("beautiful")

local M = {}
local icon = os.getenv("HOME") .. "/.config/awesome/widget/cpu/icon.svg"

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local get_cpu_status = [[
    sh -c "
    top -bn1 | awk '/Cpu\(s\)/ {print (100-$8)\"%\"}'
    "
]]

M.widget = awful.widget.watch(get_cpu_status, 5, function(widget, stdout)
    widget:set_markup(markup(stdout, { fg = beautiful.widget_text }))
end)

return M
