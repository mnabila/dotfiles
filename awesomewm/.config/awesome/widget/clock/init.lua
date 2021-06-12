local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local colorize = require("utils.function").colorize
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local M = {}
local icon = os.getenv("HOME") .. "/.config/awesome/widget/clock/icon.svg"

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

M.widget = wibox.widget.textclock("<span color='" .. beautiful.widget_text .. "'>%a, %I:%M %p</span>")

M.calendar = awful.widget.calendar_popup.month({
    start_sunday = false,
    spacing = dpi(10),
    font = beautiful.font,
    long_weekdays = true,
    margin = dpi(5),
    style_month = { border_width = 1, padding = 10, border_color = beautiful.bg_focus },
    style_header = { border_width = 0, bg_color = beautiful.bg_normal },
    style_weekday = { border_width = 0, bg_color = beautiful.bg_normal },
    style_normal = { border_width = 0, bg_color = beautiful.bg_normal },
    style_focus = { border_width = 0, bg_color = beautiful.bg_focus },
})

-- Attach calendar to clock_widget
M.calendar:attach(M.widget, "br", { on_pressed = true, on_hover = false })

return M
