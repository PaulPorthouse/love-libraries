local Tests = {}

local Point = LoveLibraries:loadLibrary("point")
local Rectangle = LoveLibraries:loadLibrary("rectangle")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Point test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Point tests passed")
    return true
end

function Tests.test__constructor()
    local p1 = Point:new(1, 2)
    assert(p1.x == 1, "X value is incorrect. Expected 1, set to " .. p1.x)
    assert(p1.y == 2, "X value is incorrect. Expected 2, set to " .. p1.y)
end

function Tests.test__constrain()
    local rect = Rectangle:new(0, 0, 500, 500)

    -- test constrain minX
    local p2 = Point:new(-10, 100)
    p2:constrain(rect)
    assert(p2.x == 0, "X has not been clamped. Expected 0, set to " .. p2.x)

    -- test constrain minY
    local p3 = Point:new(100, -10)
    p3:constrain(rect)
    assert(p3.y == 0, "Y has not been clamped. Expected 0, set to " .. p3.y)

    -- test constrain minX
    local p4 = Point:new(600, 100)
    p4:constrain(rect)
    assert(p4.x == 500, "X has not been clamped. Expected 500, set to " .. p4.x)

    -- test constrain minY
    local p5 = Point:new(100, 600)
    p5:constrain(rect)
    assert(p5.y == 500, "Y has not been clamped. Expected 500, set to " .. p5.y)
end

return Tests