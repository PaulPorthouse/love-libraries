Tests = {}
local Path = LoveLibraries:loadLibrary("path")
LoveLibraries:loadExtension("TableExtension")

function Tests.start()
    print("Starting Path tests")

    -- test constructor
    local p1 = Path:new("some/file/path")
    assert(table.icompare(p1.parts,  { "some", "file", "path" }), "Path is incorrect. Expected { \"some\", \"file\", \"path\" }, set to " .. table.concat(p1.parts, ", "))

    -- lerp tests

    print("All Path tests passed")
    return true
end

return Tests