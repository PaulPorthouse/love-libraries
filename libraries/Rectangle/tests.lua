Tests = {}
Rectangle = LuaLibraries:loadLibrary("rectangle")

function Tests.start()
    print("Starting Rectangle tests")

    -- constructor
    local r1 = Rectangle:new(1, 2, 3, 4)
    assert(r1.x == 1, "X value is incorrect. Expected 1, set to " .. r1.x)
    assert(r1.y == 2, "X value is incorrect. Expected 2, set to " .. r1.y)
    assert(r1.width == 3, "Width value is incorrect. Expected 3, set to " .. r1.width)
    assert(r1.height == 4, "Height value is incorrect. Expected 4, set to " .. r1.height)

    -- move
    local r2 = Rectangle:new(10, 10, 10, 10)
    r2:move(10, 10)
    assert(r2.x == 20, "X value is incorrect. Expected 20, set to " .. r2.x)
    assert(r2.y == 20, "Y value is incorrect. Expected 20, set to " .. r2.y)
    assert(r2.width == 10, "Width value is incorrect. Expected 10, set to " .. r2.width)
    assert(r2.width == 10, "Height value is incorrect. Expected 10, set to " .. r2.height)

    -- resize
    local r3 = Rectangle:new(10, 10, 10, 10)
    r3:resize(50, 50)
    assert(r3.x == 10, "X value is incorrect. Expected 10, set to " .. r3.x)
    assert(r3.y == 10, "Y value is incorrect. Expected 10, set to " .. r3.y)
    assert(r3.width == 50, "Width value is incorrect. Expected 50, set to " .. r3.width)
    assert(r3.width == 50, "Height value is incorrect. Expected 50, set to " .. r3.height)

    -- toBoundingBox
    local r3 = Rectangle:new(10, 20, 30, 40)
    local bb1 = r3:toBoundingBox()
    assert(bb1[1] == 10, "X1 value is incorrect. Expected 10, set to " .. bb1[1])
    assert(bb1[2] == 20, "Y1 value is incorrect. Expected 20, set to " .. bb1[2])
    assert(bb1[3] == 40, "X2 value is incorrect. Expected 40, set to " .. bb1[3])
    assert(bb1[4] == 60, "Y2 value is incorrect. Expected 60, set to " .. bb1[4])

    print("All Rectangle tests passed")
    return true
end

return Tests