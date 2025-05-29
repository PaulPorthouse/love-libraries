Tests = {}
LoveLibraries:loadExtension("mathextension")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Math test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Math tests passed")
    return true
end

function Tests.test__lerp()
    assert(math.lerp(1, 2, 0.5) == 1.5, "math.lerp(1, 2, 0.5) ~= 1.5")
    assert(math.lerp(1, 2, 0) == 1, "math.lerp(1, 2, 0) ~= 1")
    assert(math.lerp(1, 2, 1) == 2, "math.lerp(1, 2, 1) ~= 2")
end

function Tests.test__rotatePointAroundOrigin()
    local rx, ry = math.rotatePointAroundOrigin(123, 456, 154, 500, 30)
    assert(math.almostEqual(rx, 127.846788), "rx is incorrect, expected 127.846788, actually " .. rx)
    assert(math.almostEqual(ry, 509.605118), "ry is incorrect, expected 509.605118, actually " .. ry)

    rx, ry = math.rotatePointAroundOrigin(123, 456, 154, 500, -45)
    assert(math.almostEqual(rx, 176.033009), "rx is incorrect, expected 176.033009, actually " .. rx)
    assert(math.almostEqual(ry, 465.192388), "ry is incorrect, expected 465.192388, actually " .. ry)
end

return Tests