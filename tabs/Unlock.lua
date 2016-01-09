---unlock
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder unlocks a level



Unlock = class()

local numberOfStarsNeededToUnlockLevel
local levelNumber
local selectedLevel
local previousLevel

local questionBox
local yesButton
local noButton

function Unlock:init()
    
    -- different costs for each level
    if selectedLevel== easyWorld then
        numberOfStarsNeededToUnlockLevel= selectedLevel.levelNumber*2
    end
    if selectedLevel== mediumWorld then
        numberOfStarsNeededToUnlockLevel= selectedLevel.levelNumber*3
    end
    if selectedLevel== hardWorld then
        numberOfStarsNeededToUnlockLevel= selectedLevel.levelNumber*4
    end
    previousLevel= selectedLevel.levelNumber-1
     
    questionBox= rect ((WIDTH/2),(HEIGHT/2), 824,568)
    yesButton= Button("Dropbox:Yes", vec2(WIDTH/2-150, HEIGHT/2-180))
    noButton= Button("Dropbox:No", vec2(WIDTH/2+150, HEIGHT/2-180))
end

function Unlock:draw()
    fontSize (90)
    background(53, 83, 96, 255)
    fill(126, 189, 221, 255)
    font("GillSans-Bold")
    textMode (CENTER)
    pushStyle ()
    rectMode(CENTER)

end
 
function Unlock:touched(touch)
    yesButton:touched(touch)
    noButton:touched(touch)
    questionBox:touched(touch)
    
    if (selectedLevel.levelIsUnlocked== true) then
        Scene.Change("selectedLevel")
        -- if it is not unlocked, ask if player would like to unlock level
    elseif (selectedLevel.levelIsUnlocked== false) then
        alert("You have not unlocked".." the previous level", "Nope!")
        end
    
    if (selectedLevel.levelIsUnlocked== false) and (selectedLevel.levelIsUnlocked== true) then
        fill(19, 25, 28, 255)
        text("Do you want to", WIDTH/2, HEIGHT/2+250)
        text("unlock this level", WIDTH/2, HEIGHT/2+100)
        text("for"..numberOfStarsNeededToUnlockLevel.." coins?", WIDTH/2, HEIGHT/2)
        yesButton:draw()
        noButton:draw()
    
    if noButton:touched(touch) then -- go back to main
        sound(SOUND_PICKUP, 0.3)
        if selectedLevel==easyWorld then
        Scene.Change("easyWorld")
        elseif selectedLevel==mediumWorld then
        Scene.Change("mediumWorld")
        elseif selectedLevel==hardWorld then
        Scene.Change("hardWorld")
        end
        end

    if (yesButton.selected== true)then -- remove current buttons
        sound(SOUND_PICKUP, 0.3)

        --- if enough stars
        if (numberOfCoinssOwned>=numberOfStarsNeededToUnlockLevel) then 
        (selectedLevel).levelIsUnlocked=true
        numberOfCoinsOwned= numberOfCoinsOwned -numberOfStarsNeededToUnlockLevel
        alert("You unlocked this level!", "Congrats!")
        if selectedLevel==easyWorld then
        Scene.Change("easyWorld")
        elseif selectedLevel==mediumWorld then
        Scene.Change("mediumWorld")
        elseif selectedLevel==hardWorld then
        Scene.Change("hardWorld")
        end
        end
        ---if not enough stars
        elseif (numberOfCoinsOwned>=numberOfStarsNeededToUnlockLevel) then
        alert("You do not have enough stars!", "Nope!")
        if selectedLevel==easyWorld then
        Scene.Change("easyWorld")
        elseif selectedLevel==mediumWorld then
        Scene.Change("mediumWorld")    
        elseif selectedLevel==hardWorld then
        Scene.Change("hardWorld")
        end
        end
    end
end
