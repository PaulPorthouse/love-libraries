
function table.getKeys(t)
    local keys = {}
    for k, v in pairs(t) do
        keys[#keys + 1] = k
    end

    return keys
end

function table.compare(this, other)
    local thiskeys = table.getKeys(this)
    local otherKeys = table.getKeys(other)

    for k in ipairs(thiskeys) do
        if otherKeys[k] == nil then
            return false
        end
        if other[k] ~= this[k] then
            return false
        end
    end

    return true
end

function table.icompare(this, other)
    if #this ~= #other then
        return false
    end

    for i, v in ipairs(this) do
        if v ~= other[i] then
            return false
        end
    end

    return true
end