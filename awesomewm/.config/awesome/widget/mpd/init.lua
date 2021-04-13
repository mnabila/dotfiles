local wibox = require("wibox")
local awful = require("awful")
local icon = os.getenv("HOME") .. "/.config/awesome/widget/mpd/icon.svg"
local colorize = require("utils.function").colorize
local markup = require("utils.function").markup
local beautiful = require("beautiful")

local M = {}

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local get_music = [[ sh -c " mpc | head -1 " ]]

M.widget = awful.widget.watch(get_music, 2, function(widget, stdout)
    if stdout:find("volume") then
        stdout = "😱 playlist empty 😱"
    end
    widget:set_markup(markup(stdout, { fg = beautiful.widget_text }))
end)

return M
