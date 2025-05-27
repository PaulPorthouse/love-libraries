-- these are extension functions to the existing math library

-- returns a value between startValue and endValue for the currentStep [0...1]
function math.lerp(startValue, endValue, currentStep)
    return startValue * (1 - currentStep) + endValue * currentStep
end