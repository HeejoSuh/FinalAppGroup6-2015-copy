-- SplashScreenScene
-- Lesson10

-- Created by: Alessandro Iaderosa
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the game logo scene

GameLogoScene = class()
local startTimeLogo
function GameLogoScene:init()
startTimeLogo = ElapsedTime
end

function GameLogoScene:draw()
    -- Codea does not automatically call this method
    sprite()
    print(ElapsedTime)
    print("End time is " .. startTimeLogo + 3)
        if(startTimeLogo + 3 < ElapsedTime)then
        Scene.Change("play")
        print("the end time is " .. ElapsedTime)
        end
    
end

function GameLogoScene:touched(touch)
    -- Codea does not automatically call this method
end
