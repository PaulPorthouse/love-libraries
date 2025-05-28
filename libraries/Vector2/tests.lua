local Tests = {}

local Vector2 = LoveLibraries:loadLibrary("vector2")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Vector2 test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Vector2 tests passed")
    return true
end

function Tests.test__constructor()
    local c1 = Vector2:new(1, 2)
    assert(c1.x == 1, "X value is incorrect. Expected 1, set to " .. c1.x)
    assert(c1.y == 2, "Y value is incorrect. Expected 2, set to " .. c1.y)
end

return Tests