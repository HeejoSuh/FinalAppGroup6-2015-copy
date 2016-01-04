--EnterName
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder gives allows players to type in their nicknames.

EnterName = class()
    
function EnterName:init()
    words=""
    showKeyboard()
end

function EnterName:keyboard(key)
    
    if key == RETURN then
        if words ~= "" then
        saveLocalData("bestPlayerName", words)
        saveLocalData("bestPlayerScore", numberOfQuestionsGotRight)
        lastSpoken = words
    
        words = ""
        Scene.Change("getStars")
    end
    elseif key == BACKSPACE then
        words = string.sub(words, 1, -2)
    else
        words = words .. key
    end
end

-- This function gets called once every frame
function EnterName:draw()
    -- This sets a dark background color 
    background(169, 201, 209, 255)
    fill(11, 11, 11, 255)
    
    -- Do your drawing here
    if words then
        font("CourierNewPSMT")
        fontSize(50)
        textWrapWidth(WIDTH - 20)
        text(words, WIDTH/2, HEIGHT*0.75)
    end
    fontSize(60)
    font("HelveticaNeue-Bold")
    fill(54, 54, 54, 255)
    text("Great job!",WIDTH/2, 680)
    text("Type in a nickname to be shown on the board!", WIDTH/2, 600)
end

function EnterName:touched(touch)
    if touch.tapCount == 1 and touch.state == ENDED then
        showKeyboard()
    end
    if touch.tapCount == 2 and touch.state == ENDED then
        hideKeyboard()
    end
end
