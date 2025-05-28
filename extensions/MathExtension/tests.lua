Tests = {}
LoveLibraries:loadExtension("mathextension")

function Tests.start()
    print("Starting Math tests")

    -- lerp tests
    assert(math.lerp(1, 2, 0.5) == 1.5, "math.lerp(1, 2, 0.5) ~= 1.5")
    assert(math.lerp(1, 2, 0) == 1, "math.lerp(1, 2, 0) ~= 1")
    assert(math.lerp(1, 2, 1) == 2, "math.lerp(1, 2, 1) ~= 2")

    print("All Math tests passed")
    return true
end

return Tests