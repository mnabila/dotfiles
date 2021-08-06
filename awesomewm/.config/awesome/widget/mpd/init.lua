local wibox = require("wibox")
local awful = require("awful")
local colorize = require("utils.function").colorize
local markup = require("utils.function").markup
local beautiful = require("beautiful")
local gears = require("gears")

local M = {}
local icon = os.getenv("HOME") .. "/.config/awesome/widget/mpd/icon.svg"

local cmd = [[ sh -c "mpc -f '[[%artist% - ]%title%]|[%file%]' current" ]]

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

M.widget = awful.widget.watch(cmd, 2, function(widget, stdout)
    local length_text = 40

    if #stdout <= 0 then
        stdout = "😱 playlist empty 😱"
    elseif #stdout >= length_text then
        stdout = string.sub(stdout, 0, length_text)
        stdout = stdout .. "..."
    end

    widget:set_markup_silently(markup(stdout, { fg = beautiful.widget_text }))
end)

M.widget:add_button(awful.button({}, 1, function(event)
    awful.spawn.with_shell("mpc toggle")
end))

return M
