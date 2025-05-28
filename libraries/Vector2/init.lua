local Vector2 = {}
Vector2.__index = Vector2
Vector2.__version = "0.0.1"

function Vector2:new(x, y)
    local p = { x = x or 0, y = y or 0}
    setmetatable(p, self)
    return p
end



return Vector2