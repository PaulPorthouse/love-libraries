local LoveLibraries = { }
LoveLibraries.__index = LoveLibraries
LoveLibraries.__version = "0.0.1"

function LoveLibraries:new(basePath)
    if basePath:sub(-1) ~= "/" then basePath = basePath .. "/" end
    local ll = {
        basePath = basePath or "",
        extensionPath = basePath .. "extensions/",
        libraryPath = basePath .. "libraries/"
    }
    setmetatable(ll, self)
    return ll
end

function LoveLibraries:listLibraries()
    return love.filesystem.getDirectoryItems(self.libraryPath)
end

function LoveLibraries:listExtensions()
    return love.filesystem.getDirectoryItems(self.extensionPath)
end

function LoveLibraries:loadLibrary(libraryName)
    return require (self.libraryPath .. libraryName)
end

function LoveLibraries:loadExtension(extensionName)
    require (self.extensionPath .. extensionName)
end

function LoveLibraries:loadLibraries(libraryNames)
    local objs = {}
    for _, name in ipairs(libraryNames) do
        objs[name] = self:loadLibrary(name)
    end
    return objs
end

function LoveLibraries:loadExtensions(extensionNames)
    for _, name in ipairs(extensionNames) do
        self:loadExtension(name)
    end
end

function LoveLibraries:loadAllLibraries()
    local allLibs = self:listLibraries()
    local libs = {}
    for _, l in ipairs(allLibs) do
        libs[l] = self:loadLibrary(l)
    end

    return libs
end

function LoveLibraries:loadAllExtensions()
    local allExtensions = self:listExtensions()
    for _, e in ipairs(allExtensions) do
        self:loadExtension(e)
    end
end

return LoveLibraries:new(...)