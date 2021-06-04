local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local markup = require("utils.function").markup
local colorize = require("utils.function").colorize
local home = os.getenv("HOME")

local up = home .. "/.config/awesome/widget/netspeed/up.svg"
local down = home .. "/.config/awesome/widget/netspeed/down.svg"
local wlan_on = home .. "/.config/awesome/widget/netspeed/wifi_on.svg"
local wlan_off = home .. "/.config/awesome/widget/netspeed/wifi_off.svg"

local M = {}

-- Netspeed
M.up_icon = wibox.widget.imagebox(colorize(up, beautiful.widget_icon))
M.down_icon = wibox.widget.imagebox(colorize(down, beautiful.widget_icon))

M.network_icon = wibox.widget.imagebox(colorize(wlan_on, beautiful.widget_icon))

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
local get_ssid = [[
    sh -c "nmcli device show wlan0 | grep CONNECTION | cut -d : -f 2"
]]


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

M.ssid = awful.widget.watch(get_ssid, 5, function(widget, stdout)
    local ssid = stdout:match("^%s*(.-)%s*$")
    if ssid == "--" then
        M.network_icon:set_image(colorize(wlan_off, beautiful.widget_icon))
        widget:set_markup(markup("offline", {fg = beautiful.widget_text}))
    else
        M.network_icon:set_image(colorize(wlan_on, beautiful.widget_icon))
        widget:set_markup(markup(ssid, {fg = beautiful.widget_text}))
    end
end)

return M
