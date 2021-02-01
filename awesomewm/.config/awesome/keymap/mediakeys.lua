local gears = require("gears")
local awful = require("awful")

local M = {}

function M.get()
    local globalkeys = gears.table.join(
        awful.key(
            {},
            "XF86AudioLowerVolume",
            function()
                awful.spawn.with_shell("pamixer --decrease 5")
                awesome.emit_signal("volume")
            end,
            {description = "lower the volume", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioRaiseVolume",
            function()
                awful.spawn.with_shell("pamixer --increase 5")
                awesome.emit_signal("volume")
            end,
            {description = "raise the volume", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioMute",
            function()
                awful.spawn.with_shell("pamixer --toggle-mute")
                awesome.emit_signal("volume")
            end,
            {description = "mute the audio", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioPlay",
            function()
                awful.spawn.with_shell("mpc toggle")
            end,
            {description = "toggle the audio", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioNext",
            function()
                awful.spawn.with_shell("mpc next")
            end,
            {description = "toggle the audio", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioPrev",
            function()
                awful.spawn.with_shell("mpc prev")
            end,
            {description = "toggle the audio", group = "media"}
        ),
        -- Brightness
        awful.key(
            {},
            "XF86MonBrightnessDown",
            function()
                awful.spawn.with_shell("light -U 5")
                awesome.emit_signal("brightness")
            end,
            {description = "decrease brightness", group = "brightness"}
        ),
        awful.key(
            {},
            "XF86MonBrightnessUp",
            function()
                awful.spawn.with_shell("light -A 5")
                awesome.emit_signal("brightness")
            end,
            {description = "increase brightness", group = "brightness"}
        ),
        -- display
        awful.key(
            {},
            "XF86Display",
            function()
                awful.spawn.with_shell("dmenu_monitor")
            end,
            {description = "increase brightness", group = "brightness"}
        ),
        awful.key(
            {},
            "XF86SceenSaver",
            function()
                awful.spawn.with_shell("slimlock")
            end,
            {description = "increase brightness", group = "brightness"}
        )
    )

    return globalkeys
end

return setmetatable({}, { __call = function(_, ...) return M.get(...) end })
