local Tests = {}

LoveLibraries:loadExtension("tableextension")

function Tests:start()
    local fs = table.functions(self, "^test__")
    print("Starting " .. #fs .. " Table test(s)")

    for _, f in ipairs(fs) do
        f()
    end

    print("All Table tests passed")
    return true
end

function Tests:test__containsValue()
    local t1 = { 1, 2, 3, 4, 5 }
    assert(table.containsValue(t1, 1), "Table is incorrectly reporting that value is missing")
    assert(table.containsValue(t1, 6) == false, "Table is incorrectly reporting that it contains the value")
end

return Tests