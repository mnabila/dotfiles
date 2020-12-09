local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")


local M = {}

function M.get(clientkeys, clientbuttons)
    local rules = {
        -- All clients will match this rule.
        {
            rule = {},
            properties = {
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap + awful.placement.no_offscreen
            }
        },
        -- Floating clients.
        {
            rule_any = {
                instance = {
                    "copyq", -- Includes session name in class.
                    "pinentry"
                },
                class = {
                    "Arandr",
                    "Blueman-manager",
                    "Gpick",
                    "Kruler",
                    "Connman-gtk"
                },
                -- Note that the name property shown in xprop might be set slightly after creation of the client
                -- and the name shown there might not match defined rules here.
                name = {
                    "Event Tester", -- xev.
                    "Media viewer" 
                },
                role = {
                    "AlarmWindow", -- Thunderbird's calendar.
                    "ConfigManager", -- Thunderbird's about:config.
                    "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
                }
            },
            properties = {
                floating = true,
                placement = awful.placement.centered 
            }
        },
        -- Add titlebars to normal clients and dialogs
        {
            rule_any = {
                type = {"normal", "dialog"}
            },
            properties = {
                titlebars_enabled = false,
            }
        },
    }
    -- }}}

    return rules
end

return setmetatable({}, { __call = function(_, ...) return M.get(...) end })
