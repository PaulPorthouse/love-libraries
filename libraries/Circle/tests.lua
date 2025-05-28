local Tests = {}

local Circle = LoveLibraries:loadLibrary("circle")
local Point = LoveLibraries:loadLibrary("point")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Circle test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Circle tests passed")
    return true
end

function Tests.test__constructor()
    local c1 = Circle:new(1, 2, 3)
    assert(c1.position ~= nil, "Position is nil")
    assert(c1.position.x == 1, "X value is incorrect. Expected 1, set to " .. c1.position.x)
    assert(c1.position.y == 2, "Y value is incorrect. Expected 2, set to " .. c1.position.y)
    assert(c1.radius == 3, "Radius value is incorrect. Expected 3, set to " .. c1.radius)

    local c2 = Circle:new(Point:new(1, 2), 3)
    assert(c2.position.x == 1, "X value is incorrect. Expected 1, set to " .. c2.position.x)
    assert(c2.position.y == 2, "Y value is incorrect. Expected 2, set to " .. c2.position.y)
    assert(c2.radius == 3, "Radius value is incorrect. Expected 3, set to " .. c2.radius)
end

return Tests