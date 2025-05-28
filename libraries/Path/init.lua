local Path = {}
Path.__index = Path
Path.__version = "0.0.1"

LoveLibraries:loadExtension("StringExtension")
LoveLibraries:loadExtension("TableExtension")

Path.PathSeparator = "/"

function Path:new(parts)
    local p = { parts = {} }
    if type(parts) == "table" then
        p = { parts = parts }
    elseif type(parts) == "string" then
        p = { parts = parts:split(Path.PathSeparator) }
    end

    setmetatable(p, self)
    return p
end

function Path:getPath(separator)
    separator = separator or Path.PathSeparator
    return table.concat(self.parts, separator)
end

function Path:getParts()
    return self.parts
end

function Path:removeExtension()
    return self:getPath():gsub(".[%a]+$", "")
end

function Path:getFiles(fileTree, recursive, filter)
    local path = self:getPath()
    fileTree = fileTree or {}
    recursive = recursive or true
    filter = filter or nil

	local filesTable = love.filesystem.getDirectoryItems(path)
	for i,v in ipairs(filesTable) do
		local file = path.."/"..v
		local info = love.filesystem.getInfo(file)
		if info then
			if info.type == "file" then
                if filter then
                    if file:find(filter) then
                        fileTree[#fileTree+1], _ = Path:new(file):removeExtension()
                    end
                else
                    fileTree[#fileTree+1], _ = Path:new(file):removeExtension()
                end
			elseif info.type == "directory" and recursive then
                fileTree = (Path:new(file)):getFiles(fileTree, recursive, filter)
			end
		end
	end
	return fileTree
end

return Path