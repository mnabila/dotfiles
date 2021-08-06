local gears = require("gears")
local awful = require("awful")
local modkey = require("modules.variable").modkey

local visible = {
    topbar = require("statusbar.top").visible,
    bottombar = require("statusbar.bottom").visible,
}

local M = {}

function M.get()
    local keys = gears.table.join(
        awful.key({ modkey }, "b", function()
            visible.topbar()
        end, {
            description = "show statusbar for window title",
            group = "statusbar",
        }),

        awful.key({ modkey, "Shift" }, "b", function()
            visible.bottombar()
        end, {
            description = "show statusbar for system monitor",
            group = "statusbar",
        }),

        awful.key({ modkey, "Ctrl" }, "b", function()
            visible.topbar()
            visible.bottombar()
        end, {
            description = "show statusbar for system monitor",
            group = "statusbar",
        })
    )
    return keys
end

return setmetatable({}, {
    __call = function()
        return M.get()
    end,
})
