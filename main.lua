function love.load()
    print("\n")
    LuaLibraries = require "."

    local MathTests = require "extensions/MathExtension/tests"
    MathTests.start()

    local PointTests = require "libraries/Point/tests"
    PointTests.start()

    local RectangleTests = require "libraries/Rectangle/tests"
    RectangleTests.start()

    local ColourTests = require "libraries/Colour/tests"
    ColourTests.start()
end

function love.update(dt)

end

function love.draw()

end

-- package.path = package.path .. ";?/?.lua"

-- local PointTests = require "Point/tests"
-- PointTests.start()

-- local RectangleTests = require "Rectangle/tests"
-- RectangleTests.start()

-- local ColourTests = require "Colour/tests"
-- ColourTests.start()

-- local MathTests = require "MathExtension/tests"
-- MathTests.start()

-- os.exit(0)