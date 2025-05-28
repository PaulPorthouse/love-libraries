local Point = {}
Point.__index = Point
Point.__version = "0.0.1"

function Point:new(x, y, z)
    local p = { x = x or 0, y = y or 0, z = z or 0 }
    setmetatable(p, self)
    return p
end

function Point:move(dx, dy, dz)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
    self.z = self.z + (dz or 0)
end

function Point:clamp(minX, minY, maxX, maxY, minZ, maxZ)
    minX = minX or 0; maxX = maxX or 0
    minY = minY or 0; maxY = maxY or 0
    minZ = minZ or 0; maxZ = maxZ or 0
    if self.x < minX then self.x = minX end
    if self.y < minY then self.y = minY end
    if self.z < minZ then self.z = minZ end
    if self.x > maxX then self.x = maxX end
    if self.y > maxY then self.y = maxY end
    if self.z > maxZ then self.z = maxZ end
end

function Point:angle(other)
    local dy = other.y - self.y
    local dx = other.x - self.x
    local theta = math.atan(dy / dx)
    return theta
end

function Point:distance(other)
    local dx = other.x - self.x
    local dy = other.y - self.y
    return math.sqrt(dx * dx + dy * dy)
end

return Point
