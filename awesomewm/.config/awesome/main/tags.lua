local awful = require("awful")
local func = require("utils.function")

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
awful.screen.connect_for_each_screen(
    function(s)
        -- Wallpaper
        func.set_wallpaper(s)

        -- Each screen has its own tag table.
        awful.tag({"1", "2", "3", "4", "5"}, s, awful.layout.layouts[1])
    end
)
-- }}}
