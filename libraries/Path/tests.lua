Tests = {}
local Path = LoveLibraries:loadLibrary("path")
LoveLibraries:loadExtension("TableExtension")

function Tests.start()
    print("Starting Path tests")

    local path = nil

    -- test constructor
    path = Path:new("some/file/path")
    assert(table.icompare(path.parts, { "some", "file", "path" }), "Path is incorrect. Expected { \"some\", \"file\", \"path\" }, set to " .. table.concat(path.parts, ", "))
    path = Path:new({ "some", "file", "path" })
    assert(table.icompare(path.parts, { "some", "file", "path" }), "Path is incorrect. Expected { \"some\", \"file\", \"path\" }, set to " .. table.concat(path.parts, ", "))

    -- getPath test
    path = Path:new("some/file/path")
    assert(path:getPath() == "some/file/path", "Path is incorrect. Expected \"some/file/path\", set to " .. path:getPath())

    -- getParts test
    path = Path:new("some/file/path")
    assert(table.icompare(path:getParts(), { "some", "file", "path" }), "Path is incorrect. Expected { \"some\", \"file\", \"path\" }, set to " .. table.concat(path:getParts(), ", "))

    print("All Path tests passed")
    return true
end

return Tests