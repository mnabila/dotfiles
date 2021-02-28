local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local M = {}
local tasklist_buttons = gears.table.join(
    awful.button(
        {},
        1,
        function(c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal("request::activate", "tasklist", {raise = true})
            end
        end
    )
    -- awful.button(
    --     {},
    --     3,
    --     function()
    --         awful.menu.client_list({theme = {width = 250}})
    --     end
    -- )
    -- awful.button(
    --     {},
    --     4,
    --     function()
    --         awful.client.focus.byidx(1)
    --     end
    -- ),
    -- awful.button(
    --     {},
    --     5,
    --     function()
    --         awful.client.focus.byidx(-1)
    --     end
    -- )
)


function M.widget(s)
    local tasklist = awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.currenttags,
            buttons = tasklist_buttons,
            widget_template = {
                {
                    {
                        {
                            id     = 'text_role',
                            widget = wibox.widget.textbox
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    widget = wibox.container.place
                },
                id     = 'background_role',
                widget = wibox.container.background,
            },
        }

    return tasklist
end

return M
