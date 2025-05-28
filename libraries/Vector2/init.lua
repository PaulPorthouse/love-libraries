local Vector2 = {}
Vector2.__index = Vector2
Vector2.__version = "0.0.1"

function Vector2:new(x, y)
    local p = { x = x or 0, y = y or 0}
    setmetatable(p, self)
    return p
end

function Vector2:add(other)
    if type(other) == "table" and (getmetatable(other) == Vector2) then
        self.x = self.x + other.x
        self.y = self.y + other.y
    elseif type(other) == "table" and other.x and other.y then
        self.x = self.x + other.x
        self.y = self.y + other.y
    else
        error("Argument to Vector2:add must be a Vector2 or table with x and y")
    end
    return self
end

function Vector2:subtract(other)
    if type(other) == "table" and (getmetatable(other) == Vector2) then
        self.x = self.x - other.x
        self.y = self.y - other.y
    elseif type(other) == "table" and other.x and other.y then
        self.x = self.x - other.x
        self.y = self.y - other.y
    else
        error("Argument to Vector2:subtract must be a Vector2 or table with x and y")
    end
    return self
end

function Vector2:multiply(scalarX, scalarY)
    if type(scalarX) == "number" then
        self.x = self.x * scalarX
        self.y = self.y * (scalarY or scalarX)
    elseif type(scalarX) == "table" and scalarX.x and scalarX.y then
        self.x = self.x * scalarX.x
        self.y = self.y * scalarX.y
    else
        error("Argument to Vector2:multiply must be a number or table with x and y")
    end
    return self
end

function Vector2:divide(scalarX, scalarY)
    if type(scalarX) == "number" then
        self.x = self.x / scalarX
        self.y = self.y / (scalarY or scalarX)
    elseif type(scalarX) == "table" and scalarX.x and scalarX.y then
        self.x = self.x / scalarX.x
        self.y = self.y / scalarX.y
    else
        error("Argument to Vector2:divide must be a number or table with x and y")
    end
    return self
end

function Vector2:dot(other)
    return self.x * other.x + self.y * other.y
end

function Vector2:normalize()
    local length = math.sqrt(self.x^2 + self.y^2)
    if length > 0 then
        self.x = self.x / length
        self.y = self.y / length
    end
end

function Vector2:length()
    return math.sqrt(self.x^2 + self.y^2)
end

return Vector2