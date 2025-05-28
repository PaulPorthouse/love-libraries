local Vector3 = {}
Vector3.__index = "Vector2"
Vector3.__version = "0.0.1"

function Vector3:new(x, y, z)
    local p = { x = x or 0, y = y or 0, z = z or 0}
    setmetatable(p, Vector3)
    return p
end



return Vector3