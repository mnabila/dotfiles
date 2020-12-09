local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local colorize = require("utils.function").colorize
local markup = require("utils.function").markup
local icon = os.getenv("HOME") .. "/.config/awesome/widget/hddtemp/icon.svg"

-- Storage temperature
local M = {}

local temp = {
    sda = [[ sh -c "hddtemp /dev/sda | cut -d : -f 3" ]],
    sdb = [[ sh -c "hddtemp /dev/sdb | cut -d : -f 3" ]]
}

M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))
M.widget = {
    sda = awful.widget.watch(temp.sda, 5, function(widget, stdout)
            widget:set_markup(markup(stdout, {fg = beautiful.widget_text}))
        end
    ),
    sdb = awful.widget.watch(temp.sda, 5, function(widget, stdout)
            widget:set_markup(markup(stdout, {fg = beautiful.widget_text}))
        end
    )
}

return M
