local BoundingBox = {}
BoundingBox.__index = BoundingBox
BoundingBox.__version = "0.0.1"

--local Rectangle = LoveLibraries:loadLibrary("rectangle")

function BoundingBox:new(x, y, width, height)
    local r = { x = x or 0, y = y or 0, width = width or 0, height = height or 0 }
    setmetatable(r, self)
    return r
end

-- function Rectangle:toRectangle()
--     return Rectangle:new(
--         self.x, self.y, self.width - self.x, self.height - self.y
--     )
-- end

return BoundingBox
