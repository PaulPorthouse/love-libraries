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

return Tests