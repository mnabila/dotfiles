local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local colorize = require("utils.function").colorize
local markup = require("utils.function").markup

local HOME = os.getenv("HOME")

local volume_off = HOME .. "/.config/awesome/widget/volume/volume_off.svg"
local volume_mute = HOME .. "/.config/awesome/widget/volume/volume_mute.svg"
local volume_low = HOME .. "/.config/awesome/widget/volume/volume_down.svg"
local volume_high = HOME .. "/.config/awesome/widget/volume/volume_up.svg"

local M = {}

-- Volume
M.icon = wibox.widget.imagebox(colorize(volume_low, beautiful.widget_icon))

local get_vol_status = [[
    sh -c "
    pacmd list-sinks | awk '/\\* index: /{nr[NR+7];nr[NR+11]}; NR in nr'
    "
]]

local set_volume = function(widget, stdout)
    local volume = tonumber(stdout:match('(%d+)%% /'))
    local muted = stdout:match('muted:(%s+)[yes]')

    if muted then
        M.icon:set_image(colorize(volume_off, beautiful.widget_text))
        widget:set_markup(markup("muted", {fg = beautiful.widget_text}))
    else

        if volume <= 20 then
            M.icon:set_image(colorize(volume_mute, beautiful.widget_icon))
        elseif volume <= 60 then
            M.icon:set_image(colorize(volume_low, beautiful.widget_icon))
        else
            M.icon:set_image(colorize(volume_high, beautiful.widget_icon))
        end

        widget:set_markup(markup(tostring(volume).."%", {fg = beautiful.widget_text}))
    end
end

M.widget = awful.widget.watch(get_vol_status, 120, function(widget, stdout)
        set_volume(widget, stdout)
    end)

awesome.connect_signal("volume_change", function()
        awful.spawn.easy_async_with_shell(get_vol_status, function(stdout)
                set_volume(M.widget, stdout)
            end)
    end)

return M
