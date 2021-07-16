local awful = require("awful")
local func = require("utils.function")

-- bar
local tbar = require("statusbar.bar.top")
local bbar = require("statusbar.bar.bottom")

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", func.set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    tbar.bar(s)
    bbar.bar(s)
end)
-- }}}
