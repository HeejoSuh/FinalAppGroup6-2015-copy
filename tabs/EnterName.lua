--EnterName
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder gives allows players to type in their nicknames.

EnterName = class()
    
function EnterName:init()
    words = ""
    lastSpoken = ""
    
    if numberOfQuestionsGotRight> fifthPlayer.score and numberOfQuestionsGotRight<= fourthPlayer.score then
        saveLocalData("fifthPlayer.name", theNickNamePutIn)
        saveLocalData("fifthPlayer.score", theNickNamePutIn)
    elseif numberOfQuestionsGotRight> fourthPlayer.score and numberOfQuestionsGotRight<=thirdPlayer.score then
        saveLocalData("fifthPlayer.name", fourthPlayer.name)
        saveLocalData("fifthPlayer.score", fourthPlayer.score)
        saveLocalData("fourthPlayer.name", theNickNamePutIn)
        saveLocalData("fourthPlayer.score", theNickNamePutIn)
    elseif numberOfQuestionsGotRight> thirdPlayer.score and numberOfQuestionsGotRight<=secondPlayer.score then
        saveLocalData("fifthPlayer.name", fourthPlayer.name)
        saveLocalData("fifthPlayer.score", fourthPlayer.score)
        saveLocalData("fourthPlayer.name", thirdPlayer.name)
        saveLocalData("fourthPlayer.score", thirdPlayer.score)
        saveLocalData("thirdPlayer.name", theNickNamePutIn)
        saveLocalData("thirdPlayer.score", theNickNamePutIn)
    elseif numberOfQuestionsGotRight> secondPlayer.score and numberOfQuestionsGotRight<=firstPlayer.score then
         saveLocalData("fifthPlayer.name", fourthPlayer.name)
        saveLocalData("fifthPlayer.score", fourthPlayer.score)
        saveLocalData("fourthPlayer.name", thirdPlayer.name)
        saveLocalData("fourthPlayer.score", thirdPlayer.score)
        saveLocalData("thirdPlayer.name", secondPlayer.name)
        saveLocalData("thirdPlayer.score", secondPlayer.score)
        saveLocalData("secondPlayer.name", theNickNamePutIn)
        saveLocalData("secondPlayer.score", numberOfQuestionsGotRight)
    elseif numberOfQuestionsGotRight> firstPlayer.score then
        saveLocalData("fifthPlayer.name", fourthPlayer.name)
        saveLocalData("fifthPlayer.score", fourthPlayer.score)
        saveLocalData("fourthPlayer.name", thirdPlayer.name)
        saveLocalData("fourthPlayer.score", thirdPlayer.score)
        saveLocalData("thirdPlayer.name", secondPlayer.name)
        saveLocalData("thirdPlayer.score", secondPlayer.score)
        saveLocalData("thirdPlayer.name", firstPlayer.name)
        saveLocalData("thirdPlayer.score", firstPlayer.score)
        saveLocalData("firstPlayer.name", theNickNamePutIn)
        saveLocalData("firstPlayer.score", numberOfQuestionsGotRight)
            end
    showKeyboard()
end

function EnterName:keyboard(key)
    
    if key == RETURN then
        if words ~= "" then
        theNickNamePutIn= words
        print(theNickNamePutIn)
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
