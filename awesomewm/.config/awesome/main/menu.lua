-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local M = {}
local Menu ={}

Menu.awesome = {
    {"hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end},
    {"restart", awesome.restart},
    {"quit", function() awesome.quit() end}
}

function M.get()

  -- Main Menu
  local menu_items = {
    { "awesome", Menu.awesome, beautiful.awesome_icon },
    { "open terminal", terminal },
  }

  return menu_items
end

return setmetatable({}, { __call = function(_, ...) return M.get(...) end })
