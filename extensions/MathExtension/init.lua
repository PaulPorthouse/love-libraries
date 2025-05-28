-- these are extension functions to the existing math library

-- returns a value between startValue and endValue for the currentStep [0...1]
function math.lerp(startValue, endValue, currentStep)
    return startValue * (1 - currentStep) + endValue * currentStep
end

-- clamps the currentValue between minValue and maxValue
function math.clamp(minValue, maxValue, currentValue)
    return math.min(math.max(currentValue, minValue), maxValue)
end

-- returns the angle between two points in radians (thanks, Copilot)
function math.angle(point1, point2)
    local deltaX = point2.x - point1.x
    local deltaY = point2.y - point1.y

    -- Use math.atan and handle the quadrants manually
    local angle
    if deltaX > 0 then
        angle = math.atan(deltaY / deltaX)
    elseif deltaX < 0 then
        angle = math.atan(deltaY / deltaX) + math.pi
    else -- deltaX == 0
        if deltaY > 0 then
            angle = math.pi / 2
        elseif deltaY < 0 then
            angle = -math.pi / 2
        else
            angle = 0 -- Points are the same
        end
    end

    return angle -- Convert to degrees if needed
end