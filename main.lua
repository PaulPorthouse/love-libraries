package.path = package.path .. ";?/?.lua"

local PointTests = require "Point/tests"
PointTests.start()

local RectangleTests = require "Rectangle/tests"
RectangleTests.start()

local ColourTests = require "Colour/tests"
ColourTests.start()

local MathTests = require "MathExtension/tests"
MathTests.start()

os.exit(0)