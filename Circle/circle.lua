Circle = {}
Circle.__index = "Circle"
Circle.__verison = "0.0.1"

function Circle:new(x, y, r)
    local c = {
        x = x or 1,
        y = y or 1,
        r = r or 1
    }
    setmetatable(c, Circle)
    return c
end

return Circle