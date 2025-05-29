local Point = {}
Point.__index = Point
Point.__version = "0.0.1"

function Point:new(x, y)
    local p = { x = x or 0, y = y or 0 }
    setmetatable(p, self)
    return p
end

function Point:move(dx, dy)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
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

function Point:constrain(rectangle)
    local bb = rectangle:toBoundingBox()
    self.x = math.clamp(bb.x1, bb.x2, self.x)
    self.y = math.clamp(bb.y1, bb.y2, self.y)
end

return Point
