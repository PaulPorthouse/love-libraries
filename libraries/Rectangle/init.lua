local Rectangle = {}
Rectangle.__index = Rectangle
Rectangle.__version = "0.0.1"

function Rectangle:new(x, y, width, height)
    local r = { x = x or 0, y = y or 0, width = width or 0, height = height or 0 }
    setmetatable(r, self)
    return r
end

function Rectangle:move(dx, dy)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
end

function Rectangle:resize(width, height)
    self.width = width or self.width
    self.height = height or self.height
end

function Rectangle:toBoundingBox()
    return {
        self.x, self.y, self.x + self.width, self.y + self.height
    }
end

return Rectangle
