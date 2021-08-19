local awful = require("awful")
local tbar = require("statusbar.top")
local bbar = require("statusbar.bottom")
local func = require("utils.function")
local vars = require("modules.variable")

awful.screen.connect_for_each_screen(function(s)
    func.set_wallpaper(s)
    awful.tag(vars.tags, s, awful.layout.layouts[1])
    tbar.bar(s)
    bbar.bar(s)
end)