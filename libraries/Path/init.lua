local Path = {}
Path.__index = "Path"
Path.__version = "0.0.1"

local currentPath = (...)

LuaLibraries:loadExtension("StringExtension")

Path.PathSeparator = "/"

function Path:new(parts)
    local p = {}
    if type(parts) == "table" then
        p = { parts = parts or {} }
    elseif type(parts) == "string" then
        p = { parts = parts:split(Path.PathSeparator) }
    end

    setmetatable(p, Path)
    return p
end

function Path:GetParts()
    return self.parts
end

function Path:GetPath(separator)
    return table.concat(self.parts, separator or Path.PathSeparator)
end