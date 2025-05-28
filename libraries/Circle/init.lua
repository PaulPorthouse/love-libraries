local Circle = {}
Circle.__index = Circle
Circle.__verison = "0.0.1"

local Point = LoveLibraries:loadLibrary("point")

function Circle:new(p1, p2, p3)
    local c = {}
    if type(p1) == "table" then
        c = {
            position = p1 or Point:new(0, 0),
            radius = p2 or 1
        }
    else
        c = {
            position = Point:new(p1, p2) or Point:new(0, 0),
            radius = p3 or 1
        }
    end
    setmetatable(c, self)
    return c
end

function Circle:generatePointsOnCircumference(numberOfPoints)
    local a = 0.0
    local da = 2.0 * math.pi / numberOfPoints

    local points = {}

    for i = 0, numberOfPoints - 1 do
        x = self.position.x + self.radius * math.cos(a)
        y = self.position.y + self.radius * math.sin(a)
        points[#points + 1] = Point:new(x, y)

        a= a + da
    end

    return points
end

return Circle