local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local modkey = require("modules.variable").modkey

local M = {}

local taglist_buttons = gears.table.join(
    awful.button(
        {},
        1,
        function(t)
            t:view_only()
        end
    ),

    awful.button(
        {modkey},
        1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),

    awful.button({}, 3, awful.tag.viewtoggle),

    awful.button(
        {modkey},
        3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    )
)

function M.widget(s)
    return awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = taglist_buttons,
            widget_template = {
                {
                    {
                        {
                            id     = 'text_role',
                            widget = wibox.widget.textbox,
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    left  = 8,
                    right = 8,
                    widget = wibox.container.margin
                },
                id     = 'background_role',
                widget = wibox.container.background,
                -- Add support for hover colors and an index label
            },
        }
end

return M
