local Tests = {}
local Colour = LoveLibraries:loadLibrary("colour")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Colour test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Colour tests passed")
    return true
end

function Tests.test__constructor()
    local c1 = Colour:new(0.1, 0.2, 0.3, 0.4)
    assert(c1.r == 0.1, "Red value is incorrect. Expected 0.1, set to " .. c1.r)
    assert(c1.g == 0.2, "Green value is incorrect. Expected 0.2, set to " .. c1.r)
    assert(c1.b == 0.3, "Blue value is incorrect. Expected 0.3, set to " .. c1.r)
    assert(c1.a == 0.4, "Alpha value is incorrect. Expected 0.4, set to " .. c1.r)
end

return Tests