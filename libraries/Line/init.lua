local Line = {}
Line.__index = Line
Line.__version = "0.0.1"

function Line:new(points)
    local l = points or {}
    setmetatable(l, self)
    return l
end

return Line