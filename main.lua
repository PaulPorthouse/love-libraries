function love.load()
    print("\n")

    if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
    end

    LoveLibraries = require "."

    -- extension tests
    local MathTests = require "extensions/MathExtension/tests"
    MathTests.start()

    -- library tests
    local CircleTests = require "libraries/Circle/tests"
    CircleTests.start()

    local PointTests = require "libraries/Point/tests"
    PointTests.start()

    local RectangleTests = require "libraries/Rectangle/tests"
    RectangleTests.start()

    local ColourTests = require "libraries/Colour/tests"
    ColourTests.start()

    local PathTests = require "libraries/Path/tests"
    PathTests.start()

    local Vector2Tests = require "libraries/Vector2/tests"
    Vector2Tests.start()

    local Vector3Tests = require "libraries/Vector3/tests"
    Vector3Tests.start()

    local Vector4Tests = require "libraries/Vector4/tests"
    Vector4Tests.start()
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