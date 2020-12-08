local awful = require("awful")
local func = require("statusbar.libs.function")

-- bar
local tbar = require("statusbar.bar.top")
local bbar = require("statusbar.bar.bottom")

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", func.set_wallpaper)

awful.screen.connect_for_each_screen(
    function(s)
        -- Wallpaper
        func.set_wallpaper(s)

        -- Each screen has its own tag table.
        awful.tag({"1", "2", "3", "4", "5"}, s, awful.layout.layouts[1])

        tbar.bar(s)
        bbar.bar(s)
    end
)
-- }}}
