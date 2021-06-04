local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local margin = wibox.container.margin

local M = {}

function M.set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

function M.text_wrapper(widget, left, right, top, bottom)
    left = left or 0
    right = right or 6
    top = top or 4
    bottom = bottom or 4

    return margin(widget, dpi(left), dpi(right), dpi(top), dpi(bottom))
end

function M.icon_wrapper(icon, left, right, top, bottom)
    left = left or 4
    right = right or 4
    top = top or 4
    bottom = bottom or 4

    return margin(icon, dpi(left), dpi(right), dpi(top), dpi(bottom))
end

function M.colorize(icon, color)
    return gears.color.recolor_image(icon, color)
end

function M.markup(content, opts)
    local fg = opts.fg or ""

    return string.format('<span foreground="%s">%s</span>', fg, content)
end

return M
