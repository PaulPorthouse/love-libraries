local Tests = {}

LoveLibraries:loadExtension("stringextension")
LoveLibraries:loadExtension("tableextension")

function Tests:start()

    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " String test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All String tests passed")
    return true
end

function Tests:test__split()
    local input = "hello/world"

    local output = string.split(input, "/")
    assert(type(output) == "table", "Output is not a table: " .. type(output))
    assert(#output == 2, "Wrong number of entries in the output table " .. #output)
    assert(output[1] == "hello", "First value is incorrect " .. output[1])
    assert(output[2] == "world", "Second value is incorrect " .. output[1])

    return true
end

return Tests