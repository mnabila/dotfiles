local gears = require("gears")
local awful = require("awful")
local modkey = require("modules.variable").modkey

local M = {}

function M.get()
    local clientbuttons = gears.table.join(
        awful.button({}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end),

        awful.button({ modkey }, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end),

        awful.button({ modkey }, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    return clientbuttons
end

return setmetatable({}, {
    __call = function()
        return M.get()
    end,
})
