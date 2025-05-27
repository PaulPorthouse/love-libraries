Colour = {}
Colour.__index = "Colour"
Colour.__version = "0.0.1"

require "mathextension"

function Colour:new(r, g, b, a)
    local c = {
        r = r or 1,
        g = g or 1,
        b = b or 1,
        a = a or 1
    }
    setmetatable(c, Colour)
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

return Colour