local wibox = require("wibox")
local awful = require("awful")
local func = require("utils.function")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi
local margin = wibox.container.margin

-- Modules
local taglist = require("widget.taglist")
local systray = require("widget.systray")
local memory = require("widget.memory")
local cpu = require("widget.cpu")
local netspeed = require("widget.netspeed")
local clock = require("widget.clock")
local temp = require("widget.temp")
local volume = require("widget.volume")
local hddtemp = require("widget.hddtemp")
local brightness = require("widget.brightness")
local mpd = require("widget.mpd")

local M = {}

local bar = awful.wibar({ position = "bottom", screen = s, height = 23 })

function M.bar(s)
    -- Create the wibox
    -- Add widgets to the wibox
    bar:setup({
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            taglist.widget(s),
            func.icon_wrapper(mpd.icon, 6, 6, 6, 6),
            func.text_wrapper(mpd.widget, 0, 0, 0, 3),
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        {
            layout = wibox.layout.fixed.horizontal,

            func.icon_wrapper(netspeed.network_icon, 5, 5, 5, 5),
            func.text_wrapper(netspeed.ssid, 0, 0, 0, 3),
            func.icon_wrapper(netspeed.down_icon),
            func.text_wrapper(netspeed.down),
            func.icon_wrapper(netspeed.up_icon),
            func.text_wrapper(netspeed.up),

            func.icon_wrapper(temp.icon),
            func.text_wrapper(temp.widget),

            func.icon_wrapper(hddtemp.icon, 5, 0, 5, 5),
            func.text_wrapper(hddtemp.widget.sda),
            func.icon_wrapper(hddtemp.icon, 5, 0, 5, 5),
            func.text_wrapper(hddtemp.widget.sdb),

            func.icon_wrapper(cpu.icon),
            func.text_wrapper(cpu.widget),

            func.icon_wrapper(memory.icon),
            func.text_wrapper(memory.widget),

            func.icon_wrapper(brightness.icon, 6, 6, 6, 6),
            func.text_wrapper(brightness.widget),

            func.icon_wrapper(volume.icon),
            func.text_wrapper(volume.widget),

            func.icon_wrapper(clock.icon, 5, 5, 5, 5),
            func.text_wrapper(clock.widget),

            margin(systray.widget, dpi(0), dpi(2), dpi(4), dpi(4)),
        },
    })
    return bar
end

function M.visible()
    bar.visible = not bar.visible
end

return M
