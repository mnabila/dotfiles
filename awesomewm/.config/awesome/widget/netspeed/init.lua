local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local markup = require("utils.function").markup
local colorize = require("utils.function").colorize

local up = os.getenv("HOME") .. "/.config/awesome/widget/netspeed/up.svg"
local down = os.getenv("HOME") .. "/.config/awesome/widget/netspeed/down.svg"
local network = os.getenv("HOME") .. "/.config/awesome/widget/netspeed/network.svg"

local M = {}

-- Netspeed
M.up_icon = wibox.widget.imagebox(colorize(up, beautiful.widget_icon))
M.down_icon = wibox.widget.imagebox(colorize(down, beautiful.widget_icon))

M.network_icon = wibox.widget.imagebox(colorize(network, beautiful.widget_icon))

local up_old = 0
local down_old = 0

local speed = {
    up = [[
        sh -c "cat /sys/class/net/[w]*/statistics/tx_bytes"
    ]],
    down = [[
        sh -c "cat /sys/class/net/[w]*/statistics/rx_bytes"
    ]]
}


M.up = awful.widget.watch(speed.up, 2, function(widget, stdout)
        local num
        if up_old == 0 then
            num = 0
        else
            num = math.floor((tonumber(stdout) - up_old) / 1024)
        end
        widget:set_markup(markup(tostring(num).."KiB", {fg = beautiful.widget_text}))
        up_old = tonumber(stdout)
    end)

M.down = awful.widget.watch(speed.down, 2, function(widget, stdout)
        local num
        if down_old == 0 then
            num = 0
        else
            num = math.floor((tonumber(stdout) - down_old) / 1024)
        end
        widget:set_markup(markup(tostring(num).."KiB", {fg = beautiful.widget_text}))
        down_old = tonumber(stdout)
    end)

return M
