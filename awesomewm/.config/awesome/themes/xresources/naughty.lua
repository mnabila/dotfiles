local naughty = require("naughty")
local beautiful = require("beautiful")
local wibox = require("wibox")

naughty.connect_signal("request::display", function(notif)
    if notif.urgency == "critical" then
        notif.timeout = 0
    else
        notif.timeout = 4
    end

    local widget_template = {
        {
            {
                {
                    {
                        {

                            notification = notif,
                            widget = naughty.widget.icon,
                            resize_strategy = "center",
                        },
                        {
                            naughty.widget.title,
                            naughty.widget.message,
                            spacing = 4,
                            layout = wibox.layout.fixed.vertical,
                        },
                        fill_space = true,
                        spacing = 10,
                        layout = wibox.layout.fixed.horizontal,
                    },
                    layout = wibox.layout.fixed.vertical,
                },
                margins = beautiful.notification_margin,
                widget = wibox.container.margin,
            },
            id = "background_role",
            widget = naughty.container.background,
        },
        strategy = "max",
        width = beautiful.notification_width,
        height = beautiful.notification_height,
        widget = wibox.container.constraint,
    }

    naughty.layout.box({
        notification = notif,
        type = "notification",
        widget_template = widget_template,
        ontop = true,
        minimum_width = beautiful.notification_width,
        maximum_width = beautiful.notification_width,
        offset = {
            y = 100,
            x = 1000,
        },
        position = "top_right",
    })
end)
