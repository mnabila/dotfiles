local gears = require("gears")
local awful = require("awful")

local M = {}
local menu_items = require("main.menu")
local menu = awful.menu(
    {
        items = menu_items()
    }
)

function M.get()
    local buttons = gears.table.join(
        awful.button({}, 3, function() menu:toggle() end)
        -- awful.button({}, 4, awful.tag.viewnext),
        -- awful.button({}, 5, awful.tag.viewprev)
    )
    return buttons
end

return setmetatable({}, { __call = function(_, ...) return M.get(...) end })
