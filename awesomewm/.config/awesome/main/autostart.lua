local awful = require("awful")

do
    local cmds = {
        "lxpolkit",
        "xautolock -time 15 -locker 'slimlock;gpg-connect-agent reloadagent /bye'",
        "clipmenud",
        "xfce4-power-manager",
        "light -S 30",
        -- "viper start",
        "udiskie",
    }

    for _, i in pairs(cmds) do
        awful.spawn.with_shell(i .. "&")
    end
end
