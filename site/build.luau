local fs = require("@std/fs")
local site = require("./")

pcall(fs.mkdir, "dist")

fs.writeStringToFile("dist/index.html", site())
