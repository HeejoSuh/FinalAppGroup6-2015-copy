-- MainScene
-- Lesson10

-- Created by: Alessandro Iaderosa
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the second scene

MainScene = class()
local playButton
local settingsButton
local creditsButton
local storeButton
--global to this file
--sprite("")

function MainScene:init()
playButton = Button("Dropbox:Blue Forward Circle Button", vec2(WIDTH/2, HEIGHT/2))
settingsButton = Button("Dropbox:Blue Settings Button", vec2(80, 80, 100, 100))
creditsButton = Button("Dropbox:Blue Level Menu Button", vec2(950, 80, 100, 100))
storeButton = Button("Planet Cute:Character Boy", 100, HEIGHT-100)
   
    
end


function MainScene:draw()
    -- Codea does not automatically call this method
    
    background(186, 186, 186, 255)
    playButton:draw()
    settingsButton:draw()
    creditsButton:draw()
    storeButton:draw()
end

function MainScene:touched(touch)
    -- Codea does not automatically call this method
    playButton:touched(touch)
    if(playButton.selected == true) then
        Scene.Change("tutorial")
    end
    settingsButton:touched(touch)
    if(settingsButton.selected == true) then
        Scene.Change("settings")
    end
    
    creditsButton:touched(touch)
    if(creditsButton.selected == true) then
        Scene.Change("credits")
    end
    storeButton:touched(touch) 
    if (storeButton.selected == true) then
        Scene.Change("leaderboard")
    end
end