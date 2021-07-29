local gears = require("gears")
local keymap = require("keymap")

root.buttons(keymap.globalbuttons())
root.keys(
    gears.table.join(
        keymap.bindtotags(keymap.globalkeys()),
        keymap.mediakeys(),
        keymap.userkeys(),
        keymap.statusbarkeys()
    )
)
