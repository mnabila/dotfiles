local wibox = require("wibox")
local awful = require("awful")

-- Modules
local tasklist = require("widget.tasklist")

local M = {}

local bar = awful.wibar({position = "top", screen = s, height= 20, bg="#00000000"})

function M.bar(s)
    -- Create the wibox
    -- Add widgets to the wibox
    bar:setup {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
            },
            tasklist.widget(s),
            {
                layout = wibox.layout.fixed.horizontal,
            }
        }
    return bar
end

function M.visible()
    bar.visible = not bar.visible
end

return M
