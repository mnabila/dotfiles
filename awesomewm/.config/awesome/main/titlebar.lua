local gears = require("gears")
local awful = require("awful")
local M  = {}

function M.get()

end

return setmetatable({}, { __call = function(_, ...) return M.get(...) end })
