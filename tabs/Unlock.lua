---unlock
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder unlocks a level


Unlock = class()

local numberOfCoinsNeededToUnlockLevel
local selectedLevel

local yesButton
local noButton

function Unlock:init()
    
    -- different costs for each level
    numberOfCoinsNeededToUnlockLevel= string.format("%d", i*1.7)
    yesButton= Button("Dropbox:Yes", vec2(WIDTH/2-150, HEIGHT/2-200))
    noButton= Button("Dropbox:No", vec2(WIDTH/2+150, HEIGHT/2-200))
end

function Unlock:draw()
    fontSize (90)
    background(53, 83, 96, 255)
    fill(126, 189, 221, 255)
    font("GillSans-Bold")
    textMode (CENTER)
    pushStyle ()
    rectMode(CENTER)
    rect (WIDTH/4, HEIGHT/4, WIDTH/2, HEIGHT/2)
    
    fill(19, 25, 28, 255)
    text("Do you want to", WIDTH/2, HEIGHT/2+200)
    text("unlock this level", WIDTH/2, HEIGHT/2+100)
    text("for"..numberOfCoinsNeededToUnlockLevel.." coins?", WIDTH/2, HEIGHT/2-30)
    yesButton:draw()
    noButton:draw()

end
 
function Unlock:touched(touch)
    yesButton:touched(touch)
    noButton:touched(touch)
    questionBox:touched(touch)
    
    if noButton:touched(touch) then -- go back to main
        sound(SOUND_PICKUP, 0.3)
        if selectedLevel<=10 then
        Scene.Change("easyWorld")
        elseif selectedLevel>=11 and selectedLevel<=20 then
        Scene.Change("mediumWorld")
        elseif selectedLevel>=21 then
        Scene.Change("hardWorld")
        end
        end

    if (yesButton.selected== true)then -- remove current buttons
        sound(SOUND_PICKUP, 0.3)

        --- if enough stars
        if (numberOfCoinssOwned>=numberOfStarsNeededToUnlockLevel) then 
        (selectedLevel).levelIsUnlocked=true
        numberOfCoinsOwned= numberOfCoinsOwned -numberOfCoinsNeededToUnlockLevel
        alert("You unlocked this level!", "Congrats!")
        if selectedLevel<=10 then
        Scene.Change("easyWorld")
        elseif selectedLevel>=11 and selectedLevel<=20 then
        Scene.Change("mediumWorld")
        elseif selectedLevel>=21 then
        Scene.Change("hardWorld")
        end
        end
        ---if not enough stars
        elseif (numberOfCoinsOwned>=numberOfCoinsNeededToUnlockLevel) then
        alert("You do not have enough stars!", "Nope!")
        if selectedLevel<=10 then
        Scene.Change("easyWorld")
        elseif selectedLevel>=11 and selectedLevel<=20 then
        Scene.Change("mediumWorld")
        elseif selectedLevel>=21 then
        Scene.Change("hardWorld")
        end
    end
end
