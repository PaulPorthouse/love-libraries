local Circle = {}
Circle.__index = "Circle"
Circle.__verison = "0.0.1"

function Circle:new(x, y, radius)
    local c = {
        x = x or 1,
        y = y or 1,
        radius = radius or 1
    }
    setmetatable(c, Circle)
    return c
end

return Circle