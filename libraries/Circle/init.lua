local Circle = {}
Circle.__index = Circle
Circle.__verison = "0.0.1"

local Point = LoveLibraries:loadLibrary("point")

function Circle:new(p1, p2, p3)
    local c = {}
    if type(p1) == "table" then
        c = {
            position = p1 or Point:new(0, 0),
            radius = p2 or 1
        }
    else
        c = {
            position = Point:new(p1, p2) or Point:new(0, 0),
            radius = p3 or 1
        }
    end
    setmetatable(c, self)
    return c
end

return Circle