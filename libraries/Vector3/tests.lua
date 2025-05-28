local Tests = {}

local Vector3 = LoveLibraries:loadLibrary("vector3")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Vector3 test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Vector3 tests passed")
    return true
end

function Tests.test__constructor()
    local c1 = Vector3:new(1, 2, 3)
    assert(c1.x == 1, "X value is incorrect. Expected 1, set to " .. c1.x)
    assert(c1.y == 2, "Y value is incorrect. Expected 2, set to " .. c1.y)
    assert(c1.z == 3, "Z value is incorrect. Expected 3, set to " .. c1.z)
end

return Tests