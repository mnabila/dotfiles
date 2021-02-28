local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gears = require("gears")

-- inherit default theme
local theme = dofile(gears.filesystem.get_themes_dir() .. "default/theme.lua")

theme.font = "Iosevka 10"

-- background
theme.bg_normal   = xrdb.background
theme.bg_focus    = xrdb.color3
theme.bg_urgent   = xrdb.color9
theme.bg_minimize = xrdb.color8
theme.bg_systray  = theme.bg_normal

-- foreground
theme.fg_normal   = xrdb.foreground
theme.fg_focus    = theme.bg_normal
theme.fg_urgent   = theme.bg_normal
theme.fg_minimize = theme.bg_normal

-- border
theme.useless_gap   = dpi(2)
theme.border_width  = dpi(2)
theme.border_normal = xrdb.color8
theme.border_focus  = theme.bg_focus
theme.border_marked = xrdb.color10

-- tooltip
theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal

-- menu
theme.menu_submenu_icon = nil
theme.menu_font         = theme.font
theme.menu_height       = dpi(25)
theme.menu_width        = dpi(100)
theme.menu_border_color = theme.bg_normal
theme.menu_border_width = theme.border_width
theme.menu_fg_focus     = theme.bg_normal
theme.menu_bg_focus     = theme.border_focus
theme.menu_fg_normal    = theme.fg_normal
theme.menu_bg_normal    = theme.bg_normal


-- widget
theme.widget_icon = xrdb.color3
theme.widget_text = xrdb.foreground

-- notification
theme.notification_bg           = theme.bg_normal
theme.notification_fg           = theme.fg_normal
theme.notification_font         = theme.font
theme.notification_margin       = dpi(16)
theme.notification_width        = dpi(350)
theme.notification_max_width    = theme.notification_width
theme.notification_icon_size    = dpi(32)
theme.notification_border_width = dpi(1)
theme.notification_border_color = theme.bg_focus
theme.notification_warning_bg   = xrdb.color1
theme.notification_warning_fg   = theme.bg_normal

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- taglist
-- Generate taglist squares:
local taglist_square_size = dpi(6)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Try to determine if we are running light or dark colorscheme:
local bg_numberic_value = 0;
for s in theme.bg_normal:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
    bg_numberic_value = bg_numberic_value + tonumber("0x" .. s);
end

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
