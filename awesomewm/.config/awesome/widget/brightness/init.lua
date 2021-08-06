local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local colorize = require("utils.function").colorize
local markup = require("utils.function").markup

local M = {}
local icon = os.getenv("HOME") .. "/.config/awesome/widget/brightness/icon.svg"

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local cmd = [[ sh -c "light -G" ]]

M.widget = awful.widget.watch(cmd, 5, function(widget, stdout)
    widget:set_markup_silently(markup(math.floor(stdout) .. "%", { fg = beautiful.widget_text }))
end)

return M
