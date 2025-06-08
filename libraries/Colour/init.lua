local Colour = {}
Colour.__index = Colour
Colour.__version = "0.0.1"

LoveLibraries:loadExtension("MathExtension")

function Colour:new(r, g, b, a)
    local c = {
        r = r or 1,
        g = g or 1,
        b = b or 1,
        a = a or 1
    }
    setmetatable(c, self)
    return c
end

function Colour:lerp(startColour, endColour, currentStep)
    return Colour:new(
        math.lerp(startColour.r, endColour.r, currentStep),
        math.lerp(startColour.g, endColour.g, currentStep),
        math.lerp(startColour.b, endColour.b, currentStep),
        math.lerp(startColour.a, endColour.a, currentStep)
    )
end

function Colour.fromRGBA(r, g, b, a)
    local r1, g1, b1, a1 = love.math.colorFromBytes(r, g, b, a)
    return Colour:new(r1, g1, b1, a1)
end

function Colour.fromHex(hex)
    local r = tonumber(hex:sub(1, 2), 16)
    local g = tonumber(hex:sub(3, 4), 16)
    local b = tonumber(hex:sub(5, 6), 16)
    local a = tonumber("FF", 16)
    if #hex == 8 then a = tonumber(hex:sub(7, 8), 16) end

    return Colour.fromRGBA(r, g, b, a)
end

return Colour