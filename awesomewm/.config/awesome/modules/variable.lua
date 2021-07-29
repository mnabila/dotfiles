local awful = require("awful")
local M = {}

M.layouts = {
    awful.layout.suit.max,
    awful.layout.suit.tile.right,
}
M.tags = { "1", "2", "3", "4", "5" }
M.terminal = "env LIBGL_ALWAYS_SOFTWARE=1 kitty"
M.editor = os.getenv("EDITOR") or "nano"
M.editor_cmd = M.terminal .. " -e " .. M.editor
M.modkey = "Mod4"

return M
