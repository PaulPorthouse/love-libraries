local Tests = {}

local Vector4 = LoveLibraries:loadLibrary("vector4")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Vector4 test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Vector4 tests passed")
    return true
end

function Tests.test__constructor()
    local c1 = Vector4:new(1, 2, 3, 4)
    assert(c1.x == 1, "X value is incorrect. Expected 1, set to " .. c1.x)
    assert(c1.y == 2, "Y value is incorrect. Expected 2, set to " .. c1.y)
    assert(c1.z == 3, "Z value is incorrect. Expected 3, set to " .. c1.z)
    assert(c1.w == 4, "W value is incorrect. Expected 3, set to " .. c1.w)
end

return Tests