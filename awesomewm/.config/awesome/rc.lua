-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")


-- {{{ Notification 
require("themes.xresources.naughty")
-- }}}

-- {{{ Error handling
require("main.errorhandling")
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(require("themes.xresources.theme"))
beautiful.wallpaper = os.getenv("HOME") .. "/Pictures/diy/mnabilagi.png"

-- This is used later as the default terminal and editor to run.
terminal   = "env LIBGL_ALWAYS_SOFTWARE=1 kitty"
editor     = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor
modkey     = "Mod4"

local keymap = {
    bindtotags = require("keymap.bindtotags"),
    clientbuttons = require("keymap.clientbuttons"),
    clientkeys = require("keymap.clientkeys"),
    globalkeys = require("keymap.globalkeys"),
    globalbuttons = require("keymap.globalbuttons"),
    mediakeys = require("keymap.mediakeys"),
    userkeys = require("keymap.userkeys"),
    statusbarkeys = require("keymap.statusbarkeys"),
}

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.max,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.spiral,
}
-- }}}

-- {{{ Tags 
require("main.tags")
-- }}}



-- {{{ Menu
require("main.menu")
-- }}}

-- {{{ Wibar
require("statusbar.init")
-- }}}

-- {{{ Bindings
-- set mouse
root.buttons(keymap.globalbuttons())
-- Set keys
root.keys(
    gears.table.join(
        keymap.bindtotags(keymap.globalkeys()),keymap.mediakeys(), keymap.userkeys(), keymap.statusbarkeys()
    )
)
-- }}}

-- {{{ Rules
local rules = require("main.rules")
awful.rules.rules = rules(keymap.clientkeys(), keymap.clientbuttons())
-- }}}

-- {{{ Signals
require("main.signal")
-- }}}

-- {{{ Autostart
require("main.autostart")
-- }}}