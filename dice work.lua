local math = require("math")

local Dice = {}
Dice.__index = Dice

function Dice:new(sides)
    local dice = {}
    setmetatable(dice, Dice)
    dice.sides = sides
    return dice
end

function Dice:roll()
    return math.random(1, self.sides)
end

local dice = Dice:new(6)
local result = dice:roll()
logToConsole("`4Dice `5rolled:`w " .. result)