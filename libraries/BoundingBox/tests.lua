local Tests = {}

local BoundingBox = LoveLibraries:loadLibrary("boundingbox")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " BoundingBox test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All BoundingBox tests passed")
    return true
end

function Tests.test__constructor()

end

return Tests