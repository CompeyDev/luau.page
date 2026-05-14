local net = require("@lute/net/server")
local fs = require("@std/fs")
local process = require("@std/process")
local task = require("@std/task")

process.run({ "lute", "site/build.luau" })

local server = net.serve(function()
	return fs.readFileToString("dist/index.html")
end)

local watcher = fs.watch("site/init.luau")

print(`Serving on http://{server.hostname}:{server.port}`)

while true do
	local event = watcher:next()
	if event then
		process.run({ "lute", "site/build.luau" })
	end
	task.wait(0.1)
end
