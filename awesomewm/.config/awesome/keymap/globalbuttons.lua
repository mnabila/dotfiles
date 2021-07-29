local gears = require("gears")
local awful = require("awful")
local modkey = require("modules.variable").modkey

local M = {}

function M.get()
    local buttons = gears.table.join(awful.button({}, 2, function()
        awful.spawn("dmenu_mager")
    end))
    return buttons
end

return setmetatable({}, {
    __call = function()
        return M.get()
    end,
})
