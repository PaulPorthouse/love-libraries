local Vector4 = {}
Vector4.__index = Vector2
Vector4.__version = "0.0.1"

function Vector4:new(x, y, z, w)
    local p = { x = x or 0, y = y or 0, z = z or 0, w = w or 0}
    setmetatable(p, self)
    return p
end



return Vector4