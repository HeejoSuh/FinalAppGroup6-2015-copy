-- Main
-- FinalAppGroup6

    -- Created by: Alessandro Iaderosa
-- Created on: Nov - 2015
-- Created for: ICS2O
-- This is the main starting point 

--global variables

DEBUG_GAMECENTER = false

local levels={}
local tableOfWrongAnswered={}
local selectedLevel

numberOfQuestionsGotRight=nil --from the game played
numberOfQuestionsGotWrong= nil --from the game played
numberOfCoinsOwned= nil
highScore= nil
stars= {}
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
    
    levels={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30}
    stars={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

    levels[1]= true
    levels[2]= false
    levels[3]= false
    levels[4]= false
    levels[5]= false
    levels[6]= false
    levels[7]= false
    levels[8]= false
    levels[9]= false
    levels[10]= false
    levels[11]= false
    levels[12]= false
    levels[13]= false
    levels[14]= false
    levels[15]= false
    levels[16]= false
    levels[17]= false
    levels[18]= false
    levels[19]= false
    levels[20]= false
    levels[21]= false
    levels[22]= false
    levels[23]= false
    levels[24]= false
    levels[25]= false
    levels[26]= false
    levels[27]= false
    levels[28]= false
    levels[29]= false
    levels[30]= false
    
    tableOfWrongAnswered.shapes={}
    tableOfWrongAnswered.names={}
    
    numberOfCoinsOwned= readGlobalData("numberOfCoinsOwned", 0)
    
    numberOfQuestionsGotRight=0
    numberOfQuestionsGotWrong=0
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
    



