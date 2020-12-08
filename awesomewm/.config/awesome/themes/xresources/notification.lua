local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi


naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(32)
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 3
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.margin = dpi(16)
naughty.config.defaults.border_width = 1
naughty.config.defaults.border_color = beautiful.bg_focus
naughty.config.defaults.position = "top_right"

naughty.config.padding = dpi(7)
naughty.config.spacing = dpi(7)
naughty.config.icon_dirs = {
    os.getenv("HOME") .. "/.local/share/icons/DarK-svg",
}
naughty.config.icon_formats = {"png", "svg"}

-- Timeouts
naughty.config.presets.low.timeout = 3
naughty.config.presets.critical.timeout = 0

naughty.config.presets.normal = {
    font = beautiful.font,
    fg = beautiful.fg_normal,
    bg = beautiful.bg_normal,
    position = "top_right",
    width = dpi(350),
    -- height = dpi(70),
    max_width = dpi(350),
    -- max_height = dpi(70),
    icon = os.getenv("HOME") .. "/Dotfiles/icons/gruvbox/alarm_off.png"
}

naughty.config.presets.low = {
    font = beautiful.font,
    fg = beautiful.fg_normal,
    bg = beautiful.bg_normal,
    position = "top_right"
}

naughty.config.presets.critical = {
    font = beautiful.font,
    fg = beautiful.background,
    bg = beautiful.color9,
    position = "top_right",
    timeout = 0
}

naughty.config.presets.ok = naughty.config.presets.normal
naughty.config.presets.info = naughty.config.presets.normal
naughty.config.presets.warn = naughty.config.presets.critical
