Point = {}
Point.__index = Point
Point.__version = "0.0.1"

function Point:new(x, y)
    local p = { x = x or 0, y = y or 0 }
    setmetatable(p, Point)
    return p
end

function Point:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end

function Point:clamp(minX, minY, maxX, maxY)
    if self.x < minX then self.x = minX end
    if self.y < minY then self.y = minY end
    if self.x > maxX then self.x = maxX end
    if self.y > maxY then self.y = maxY end
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
