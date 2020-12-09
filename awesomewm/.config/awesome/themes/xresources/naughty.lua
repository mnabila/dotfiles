local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(32)
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 3
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.margin = dpi(16)
naughty.config.defaults.border_width = dpi(1)
naughty.config.defaults.border_color = beautiful.bg_focus
naughty.config.defaults.position = "top_right"


naughty.config.padding = dpi(7)
naughty.config.spacing = dpi(7)
