-- Main
-- FinalAppGroup6

    -- Created by: Alessandro Iaderosa
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the main starting point 

--global variables

numberOfStarsOwned= 
bestPlayerName= nil
bestPlayerScore= nil

    
-- Use this function to perform your initial setup
function setup()
    
    supportedOrientations(LANDSCAPE_ANY)
    displayMode(FULLSCREEN)
    noFill()
    noSmooth()
    noStroke()
    pushStyle()

    
    -- create the scenes
    Scene("splash", SplashScreenScene)
    Scene("logo", GameLogoScene)
    Scene("play", MainScene)
    Scene("endGame", GameOverScene)
    Scene("tutorial", TutorialScene)
    Scene("settings", SettingsScene)
    Scene("credits", CreditsScene)
    Scene("world", WorldScene)
    Scene("medium", MediumWorldScene)
    Scene("easy", EasyWorldScene)
    Scene("hard", HardWorldScene)
    Scene("getStars", StarsCollect)
    Scene("EnterNewNickname", EnterName)
    Scene("leaderBoard", Ranking)
    Scene.Change("splash")
    
    --Best player information
    bestPlayerName= readLocalData("bestPlayerName", ___)
    bestPlayerScore= readLocalData("bestPlayerScore", ___)
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(255, 255, 255, 255)
    
    Scene.Draw()
end

function touched(touch)
    
    Scene.Touched(touch) 
    
    
    
end
    


