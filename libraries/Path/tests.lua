local Tests = {}

LoveLibraries:loadExtension("TableExtension")
local Path = LoveLibraries:loadLibrary("path")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Path test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Path tests passed")
    return true
end

function Tests.test__constructor()
    path = Path:new("some/file/path")
    assert(table.icompare(path.parts, { "some", "file", "path" }), "Path is incorrect. Expected { \"some\", \"file\", \"path\" }, set to " .. table.concat(path.parts, ", "))
    path = Path:new({ "some", "file", "path" })
    assert(table.icompare(path.parts, { "some", "file", "path" }), "Path is incorrect. Expected { \"some\", \"file\", \"path\" }, set to " .. table.concat(path.parts, ", "))

end

function Tests.test__getPath()
    path = Path:new("some/file/path")
    assert(path:getPath() == "some/file/path", "Path is incorrect. Expected \"some/file/path\", set to " .. path:getPath())
end

function Tests.test__getParts()
    path = Path:new("some/file/path")
    assert(table.icompare(path:getParts(), { "some", "file", "path" }), "Path is incorrect. Expected { \"some\", \"file\", \"path\" }, set to " .. table.concat(path:getParts(), ", "))
end

return Tests