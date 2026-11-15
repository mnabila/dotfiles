-- Marks files as fetched without reading their type.
local M = {}

function M:fetch(job)
	return ya.co(function()
		local updates = {}
		for _, file in ipairs(job.files) do
			if coroutine.yield(file, { mime = "application/octet-stream" }) then
				updates[file.url] = "application/octet-stream"
			end
		end
		if next(updates) then
			ya.emit("update_mimes", { updates = updates })
		end
	end)
end

return M
