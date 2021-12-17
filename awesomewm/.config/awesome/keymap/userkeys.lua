local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local vars = require("modules.variable")
local modkey = vars.modkey
local terminal = vars.terminal

local M = {}

function M.get()
    local userkeys = gears.table.join(
        awful.key({ modkey }, "d", function()
            awful.spawn("rofi -show drun")
        end, {
            description = "application launcher",
            group = "launcher",
        }),

        awful.key({ modkey, "Shift" }, "d", function()
            awful.spawn("rofi -show run")
        end, {
            description = "execute command",
            group = "launcher",
        }),

        awful.key({ modkey }, "Pause", function()
            awful.spawn("mpc toggle")
        end, {
            description = "mpc toggles between play and pause",
            group = "launcher",
        }),

        awful.key({ modkey, "Shift" }, "Pause", function()
            awful.spawn("dmenu_mpc")
        end, {
            description = "mpc playlist",
            group = "launcher",
        }),

        awful.key({ modkey }, "Menu", function()
            awful.spawn("dmenu_mager")
        end, {
            description = "show tolkit",
            group = "launcher",
        }),

        awful.key({ modkey, "Shift" }, "Tab", function()
            awful.spawn("rofi -show window")
        end, {
            description = "show window",
            group = "launcher",
        }),

        awful.key({ modkey }, "F10", function()
            awful.spawn("dmenu_todo")
        end, {
            description = "show todo",
            group = "launcher",
        }),

        awful.key({ modkey }, "F2", function()
            awful.spawn("dmenu_systemd -lines 5")
        end, {
            description = "systemd services management",
            group = "launcher",
        }),

        awful.key({ modkey }, "End", function()
            awful.spawn("dmenu_power")
        end, {
            description = "power management",
            group = "launcher",
        }),

        awful.key({ modkey }, "Delete", function()
            awful.spawn("dmenu_kill")
        end, {
            description = "task manager",
            group = "launcher",
        }),

        awful.key({ modkey }, "BackSpace", function()
            awful.spawn(
                'notify-send -i ~/Dotfiles/icons/gruvbox/lock.png "Pass Man" "Clear Cache Time Out : $(gpg-connect-agent reloadagent /bye)"'
            )
        end, {
            description = "lock password",
            group = "launcher",
        }),

        awful.key({ modkey, "Shift" }, "BackSpace", function()
            awful.spawn('dmenu_pass -p "Pass Man"')
        end, {
            description = "password manager",
            group = "launcher",
        }),

        awful.key({ modkey, "Ctrl" }, "BackSpace", function()
            awful.spawn("pwclip")
        end, {
            description = "password generator",
            group = "launcher",
        }),

        awful.key({}, "Print", function()
            awful.spawn("dmenu_screenshot")
        end, {
            description = "take screenshot",
            group = "launcher",
        }),

        awful.key({ modkey }, "q", function()
            awful.spawn("dmenu_qutebrowser")
        end, {
            description = "searh with qutebrowser",
            group = "launcher",
        }),

        awful.key({ modkey }, "p", function()
            awful.spawn('clipmenu -p "Clip"')
        end, {
            description = "clipboard manager",
            group = "launcher",
        }),

        awful.key({ modkey, "Shift" }, "p", function()
            awful.spawn.with_shell(
                'notify-send "Clipmenu" "Clipboard Empty"; clipdel -d ".*"; pkill -9 clipmenud; pkill -9 clipnotify; clipmenud'
            )
        end, {
            description = "clean clipboard",
            group = "launcher",
        }),

        awful.key({ modkey }, "F8", function()
            awful.spawn("dmenu_nmcli")
        end, {
            description = "opent network manager",
            group = "launcher",
        }),

        awful.key({ modkey, "Shift" }, "F8", function()
            awful.spawn("nm-connection-editor")
        end, {
            description = "opent network manager",
            group = "launcher",
        }),

        awful.key({ modkey }, "Print", function()
            awful.spawn("dmenu_ffmpeg")
        end, {
            description = "screen recorder",
            group = "launcher",
        }),

        awful.key({ modkey }, "a", function()
            awful.spawn("dmenu_aria2")
        end, {
            description = "download manager",
            group = "launcher",
        }),

        awful.key({ modkey }, "y", function()
            awful.spawn("ytfzf -fDH")
        end, {
            description = "youtube viewer",
            group = "launcher",
        }),

        awful.key({ modkey }, "Home", function()
            local function execute(cmd)
                local is_running = "pidof -x " .. cmd
                awful.spawn.easy_async_with_shell(is_running, function(out)
                    if #out < 1 then
                        awful.spawn(cmd)
                    else
                        naughty.notify({
                            title = "main apps",
                            text = cmd .. " is running",
                        })
                    end
                end)
            end
            execute(terminal)
            execute("telegram-desktop")
            execute("qutebrowser")
        end, {
            description = "main apps",
            group = "launcher",
        }),

        awful.key({ modkey }, "v", function()
            awful.spawn("adbclip")
        end, {
            description = "send clipboard to android",
            group = "launcher",
        })
    )
    return userkeys
end

return setmetatable({}, {
    __call = function()
        return M.get()
    end,
})
