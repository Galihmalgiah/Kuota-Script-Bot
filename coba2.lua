-- Game: Dice Roll
-- Roll the dice and check if they all have the same number.

-- Define a function to roll a dice.
function rollDice()
 return math.random(1,12)
end

-- Roll the dice 3 times.
local dice1 = rollDice()
local dice2 = rollDice()
local dice3 = rollDice()

-- Check if the dice have the same number.
if dice1 == dice2 and dice2 == dice3 then
 true
 print("You rolled " .. dice1 .. ", " .. dice2 .. ", and " .. dice3 .. ". Try again!")
end