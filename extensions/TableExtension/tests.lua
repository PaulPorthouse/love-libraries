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

return Tests