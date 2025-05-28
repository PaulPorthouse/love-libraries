local LuaLibraries = { }
LuaLibraries.__index = LuaLibraries
LuaLibraries.__version = "0.0.1"

function LuaLibraries:new(basePath)
    if basePath:sub(-1) ~= "/" then basePath = basePath .. "/" end
    local ll = {
        basePath = basePath or "",
        extensionPath = basePath .. "extensions/",
        libraryPath = basePath .. "libraries/"
    }
    setmetatable(ll, self)
    return ll
end

function LuaLibraries:listLibraries()
    return love.filesystem.getDirectoryItems(self.libraryPath)
end

function LuaLibraries:listExtensions()
    return love.filesystem.getDirectoryItems(self.extensionPath)
end

function LuaLibraries:loadLibrary(libraryName)
    return require (self.libraryPath .. libraryName)
end

function LuaLibraries:loadExtension(extensionName)
    require (self.extensionPath .. extensionName)
end

function LuaLibraries:loadLibraries(libraryNames)
    local objs = {}
    for _, name in ipairs(libraryNames) do
        objs[name] = self:loadLibrary(name)
    end
    return objs
end

function LuaLibraries:loadExtensions(extensionNames)
    for _, name in ipairs(extensionNames) do
        self:loadExtension(name)
    end
end

function LuaLibraries:loadAllLibraries()
    local allLibs = self:listLibraries()
    local libs = {}
    for _, l in ipairs(allLibs) do
        libs[l] = self:loadLibrary(l)
    end

    return libs
end

function LuaLibraries:loadAllExtensions()
    local allExtensions = self:listExtensions()
    for _, e in ipairs(allExtensions) do
        self:loadExtension(e)
    end
end

return LuaLibraries:new(...)