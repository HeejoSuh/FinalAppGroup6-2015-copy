-- SplashScreenScene
-- FinalAppGroup6

-- Created by: Alessandro Iaderosa
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the first scene

SplashScreenScene = class()

--global to this file
local startTimeSplash

function SplashScreenScene:init()
    startTimeSplash = ElapsedTime
    
end

function SplashScreenScene:draw()
    -- Codea does not automatically call this method
    
    background(0, 0, 0, 255)
    sprite("Dropbox:company logo2", 512, 384, 1024, 768)
    print(ElapsedTime)
    print("End time is " .. startTimeSplash + 2)
        if(startTimeSplash + 2 < ElapsedTime)then
        Scene.Change("logo")
        print("the end time is " .. ElapsedTime)
        end
end

function SplashScreenScene:touched(touch)
    -- Codea does not automatically call this method
    
    
end