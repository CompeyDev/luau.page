local fs = require("@std/fs")
local site = require("./")

if not fs.exists("dist") then
  fs.createDirectory("dist")
end

fs.writeStringToFile("dist/index.html", site())
