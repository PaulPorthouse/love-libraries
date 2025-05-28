function love.load()
    print("\n")

    LoveLibraries = require "."

    local Path = LoveLibraries:loadLibrary("path")
    local testExtensions = (Path:new("extensions")):getFiles(nil, true, "tests.lua")
    local testLibraries = (Path:new("libraries")):getFiles(nil, true, "tests.lua")

    if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
    end

    print("\nRunning " .. #testExtensions .. " extension suites")
    for _, testFile in ipairs(testExtensions) do
        local tests = require (testFile)
        tests:start()
    end

    print("\nRunning " .. #testLibraries .. " library suites")
    for _, testFile in ipairs(testLibraries) do
        local tests = require (testFile)
        tests:start()
    end
end

function love.update(dt)
    love.event.quit()
end

function love.draw()

end
