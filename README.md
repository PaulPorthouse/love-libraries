# Lua Libraries

These files are a set of custom libraries for [Lua](https://www.lua.org/about.html), specifically written for use with the [LÖVE framework](https://love2d.org/).

# Tests

At least some of the modules have tests written for them. To run the tests, run the following powershell script

```
.\runtests.ps1
```

# Deployment

To deploy the libraries to a project, copy the entire data structure to a new sub-directory in the project.

# Extensions

Extensions are generally extra functions which are added to the standard libraries. The loadExtension, loadExtensions and loadAllExtensions functions do not return anything and once they have been called, require no further code.

# Libraries

Libraries are custom objects with functions. They are implemented in an OOP form and the return from the loadLibrary, loadLibraries and loadAllLibraries is a class which will need instantiation as shown below.

```
Circle = LuaLibrary:loadLibrary("Circle")
myCircle = Circle:new(100, 100, 75)
```

# Usage

## Creating the library

```
LuaLibraries = require "libraries/lua-libraries"
```

## Listing extensions

```
local extensions = LuaLibraries:listExtensions()
print(table.concat(extensions, ", "))
```
which outputs
```
MathExtension, StringExtension
```

## Listing libraries

```
local libraries = LuaLibraries:listLibraries()
print(table.concat(libraries, ", "))
```
which outputs
```
Circle, Colour, Line, Path, Point, Rectangle, Vector2, Vector3, Vector4
```

## Importing a single extension

```
LuaLibraries:loadExtension("MathExtension")
```

## Importing multiple extensions

```
LuaLibraries:loadExtensions({ "MathExtension", "StringExtension" })
```

## Importing all extensions

```
LuaLibraries:loadAllExtensions()
```

## Importing a single library

```
Circle = LuaLibraries:loadLibrary("Circle")
```

## Importing multiple libraries

```
local libraries = LuaLibraries:loadLibraries({ "Circle", "Rectangle" })
local myCircle = libraries["Circle"]:new(123, 456, 75)
print(myCircle.x, myCircle.y, myCircle.radius)
```
which outputs
```
123     456     75
```

## Importing all libraries

```
local libraries = LuaLibraries:loadAllLibraries()
for name, library in pairs(libraries) do
    print(name)
end