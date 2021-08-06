local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local colorize = require("utils.function").colorize
local markup = require("utils.function").markup

local M = {}
local icon = os.getenv("HOME") .. "/.config/awesome/widget/memory/icon.svg"

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local cmd = [[ sh -c "free -h | awk '/^Mem/ { print $3 }' | sed s/i//g" ]]

M.widget = awful.widget.watch(cmd, 5, function(widget, stdout)
    widget:set_markup(markup(stdout, { fg = beautiful.widget_text }))
end)

return M
