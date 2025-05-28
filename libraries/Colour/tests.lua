Tests = {}
Colour = LuaLibraries:loadLibrary("colour")

function Tests.start()
    print("Starting Colour tests")

    -- test constructor
    local c1 = Colour:new(0.1, 0.2, 0.3, 0.4)
    assert(c1.r == 0.1, "Red value is incorrect. Expected 0.1, set to " .. c1.r)
    assert(c1.g == 0.2, "Green value is incorrect. Expected 0.2, set to " .. c1.r)
    assert(c1.b == 0.3, "Blue value is incorrect. Expected 0.3, set to " .. c1.r)
    assert(c1.a == 0.4, "Alpha value is incorrect. Expected 0.4, set to " .. c1.r)

    -- lerp tests

    print("All Colour tests passed")
    return true
end

return Tests