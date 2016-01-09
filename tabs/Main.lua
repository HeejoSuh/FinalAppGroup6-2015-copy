-- Main
-- FinalAppGroup6

    -- Created by: Alessandro Iaderosa
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the main starting point 

--global variables
DEBUG_GAMECENTER = false

local levelIsUnlocked
local levelNumber

local levels={}
local tableOfWrongAnswered={}
local gamecenterButton

numberOfQuestionsGotRight=nil --from the game played
numberOfQuestionsGotWrong= nil --from the game played
numberOfStarsGiven= nil  ---based on the person's score
numberOfCoinsOwned= nil

    
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
    Scene("unlock", Unlock)
    Scene("leaderBoard", Ranking)
    Scene.Change("splash")
    
    levels[i]={}
    levels[i]={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30}
    self.unlocked= false
    tableOfWrongAnswered[i]={}
    tableOfWrongAnswered[i].shapes={}
    tableOfWrongAnswered[i].names={}
    numberOfCoinsOwned= readGlobalData("numberOfCoinsOwned", 0)
    
    numberOfQuestionsGotRight=0
    numberOfQuestionsGotWrong=0
    numberOfStarsGiven=0
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
    



