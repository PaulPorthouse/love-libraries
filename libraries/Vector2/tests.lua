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

local function approx(a, b, eps)
    eps = eps or 1e-6
    return math.abs(a - b) < eps
end

function Tests.test__constructor()
    local c1 = Vector2:new(1, 2)
    assert(c1.x == 1, "X value is incorrect. Expected 1, set to " .. c1.x)
    assert(c1.y == 2, "Y value is incorrect. Expected 2, set to " .. c1.y)
end

function Tests.test__add()
    local v1 = Vector2:new(1, 2)
    local v2 = Vector2:new(3, 4)
    v1:add(v2)
    assert(v1.x == 4 and v1.y == 6, "Add Vector2 failed")
    local v3 = Vector2:new(1, 2)
    v3.add = Vector2.add -- in case method is missing
    v3:add({x=5, y=7, is=function() return false end})
    assert(v3.x == 6 and v3.y == 9, "Add table failed")
end

function Tests.test__subtract()
    local v1 = Vector2:new(5, 7)
    local v2 = Vector2:new(2, 3)
    v1:subtract(v2)
    assert(v1.x == 3 and v1.y == 4, "Subtract Vector2 failed")
    local v3 = Vector2:new(10, 10)
    v3.subtract = Vector2.subtract
    v3:subtract({x=2, y=5, is=function() return false end})
    assert(v3.x == 8 and v3.y == 5, "Subtract table failed")
end

function Tests.test__multiply()
    local v1 = Vector2:new(2, 3)
    v1:multiply(2)
    assert(v1.x == 4 and v1.y == 6, "Multiply scalar failed")
    local v2 = Vector2:new(2, 3)
    v2:multiply(2, 4)
    assert(v2.x == 4 and v2.y == 12, "Multiply scalarX, scalarY failed")
    local v3 = Vector2:new(2, 3)
    v3:multiply({x=3, y=5})
    assert(v3.x == 6 and v3.y == 15, "Multiply table failed")
end

function Tests.test__divide()
    local v1 = Vector2:new(8, 12)
    v1:divide(2)
    assert(v1.x == 4 and v1.y == 6, "Divide scalar failed")
    local v2 = Vector2:new(8, 12)
    v2:divide(2, 4)
    assert(v2.x == 4 and v2.y == 3, "Divide scalarX, scalarY failed")
    local v3 = Vector2:new(8, 12)
    v3:divide({x=2, y=3, is=function() return true end})
    assert(v3.x == 4 and v3.y == 4, "Divide Vector2 failed")
end

function Tests.test__dot()
    local v1 = Vector2:new(1, 2)
    local v2 = Vector2:new(3, 4)
    local d = v1:dot(v2)
    assert(d == 11, "Dot product failed")
end

function Tests.test__normalize()
    local v = Vector2:new(3, 4)
    v:normalize()
    assert(approx(v.x, 0.6) and approx(v.y, 0.8), "Normalize failed")
end

function Tests.test__length()
    local v = Vector2:new(3, 4)
    assert(v:length() == 5, "Length failed")
end

return Tests