local naughty = require("naughty")
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local dpi = require("beautiful.xresources").apply_dpi


naughty.config.defaults.padding = dpi(10)
naughty.config.defaults.margin = dpi(16)
naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.icon_size = beautiful.notification_icon_size
naughty.config.defaults.margin = beautiful.notification_margin
naughty.config.defaults.border_width = beautiful.notification_border_width
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.position = "top_right"
naughty.config.defaults.timeout = 3
naughty.config.defaults.width = beautiful.notification_width



-- naughty.connect_signal("request::display", function(notif)
--     naughty.layout.box{
--         notification    = notif,
--         type            = "notification",
--         bg              = beautiful.notification_bg,
--         border_color    = beautiful.notification_border_color,
--         border_width    = beautiful.notification_border_width,
--         widget_template = {
--             {
--                 {
--                     {
--                         naughty.widget.icon,
--                         {
--                             {
--                                 font = beautiful.notification_font,
--                                 markup = "<b>" .. notif.title .. "</b>",
--                                 widget = naughty.widget.title,
--                             },
--                             naughty.widget.message,
--                             spacing = 4,
--                             layout  = wibox.layout.fixed.vertical,
--                         },
--                         fill_space = true,
--                         spacing    = 4,
--                         layout     = wibox.layout.fixed.horizontal,
--                     },
--                     margins = beautiful.notification_margin,
--                     widget  = wibox.container.margin,
--                 },
--                 id     = "background_role",
--                 widget = naughty.container.background,
--                 width = beautiful.notification_width
--             },
--             strategy = "max",
--             widget   = wibox.container.constraint,
--         }
--     }
-- end)
