----StarsCollect
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder determines the number of stars given

StarsCollect= class()

local gameMode  ---the gamemode of the game played

local starFilledIn
local starBlank

local firstStarPosition= vec2(WIDTH/2-300, HEIGHT-250)
local secondStarPosition= vec2(WIDTH/2, HEIGHT-250)
local thirdStarPosition= vec2(WIDTH/2+300, HEIGHT-250)

local playAgainButton  ---goes to main/home screen
local levelsButton  ---goes to levels
local settingsButton  ---goes to settings
local nextLevelButton --goes to next level
        
local dy= HEIGHT/2
local numberOfCoinsGiven
local numberOfStarsGiven

----init
function StarsCollect:init()
    
    starFilledIn= SpriteObject("Dropbox:Star Gold")
    starBlank= SpriteObject("Dropbox:Star Black") 
    starFilledIn.draggable= false
    starBlank.draggable= false
    
      ---buttons
    nextLevelButton= Button("Dropbox:Teal Forward Button", vec2(WIDTH/2-100, dy-100*(numberOfQuestionsGotWrong+10)))
    playAgainButton= Button("Dropbox:Teal Redo Button", vec2(WIDTH/2+100, dy-100*(numberOfQuestionsGotWrong+20)))
    settingsButton= Button("Dropbox:Teal Settings Button", vec2(WIDTH/2+300, dy-100*(numberOfQuestionsGotWrong+20)))
    levelsButton= Button("Dropbox:Teal Level Menu Button", vec2(WIDTH/2-300, dy-100*(numberOfQuestionsGotWrong+10)))
    
    if numberOfQuestionsGotRight-numberOfQuestionsGotWrong>highScore then
    saveLocalData("highScore", numberOfQuestionsGotRight-numberOfQuestionsGotWrong)
    gamecenter.submitScore(math.floor(highScore), "NameThatShapeLeaderboard")
    
    --easy mode
    if (selectedLevel<=10) then
        numberOfCoinsGiven= string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*1.6)
        numberOfStarsGiven= string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*0.8)
        end
    
    ---medium
    if (selectedLevel>=11) and (selectedLevel<=20) then
        numberOfCoinsGiven= string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*1.3)
        numberOfStarsGiven= string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*0.5)
        end
    
    ---hard
    if (selectedLevel>=21) then 
        numberOfCoinsGiven= string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*1.1)
        numberOfStarsGiven= string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*0.3)
     end

    if (answerChosen== true) and IFITISCORRECT then
        numberOfQuestionsGotWrong= numberOfQuestionsGotWrong+1
        currentShape= CURRENTSHAPE
        table.insert(tableOfWrongAnswered.shapes, numberOfQuestionsGotWrong, currentShape)
      table.insert(tableOfWrongAnswered.names,numberOfQuestionsGotWrong, currentShapeName)
end
end


---draw
function StarsCollect:draw()
    background(66, 126, 131, 255)
      ---number of stars the player has achieved so far
    fontSize (50)
    fill(229, 220, 95, 255)
    font("Noteworthy-Bold")
    textMode (CENTER)
    pushStyle ()
    if (numberOfCoinsGiven~=0) then
      ---add in the achieved stars to the number of stars the player has collected
    numberOfCoinsOwned= numberOfCoinsOwned+ numberOfCoinsGiven
    end
    text(numberOfCoinsOwned, 350, 380)
    sprite("Platformer Art:Coin", 315, 380)
    
    
    fontSize (80)
    fill(18, 21, 26, 255)
    font("Verdana-Bold")
    
     --- The stars actually given(now) to the player 
    ---zero star
    if (numberOfStarsGiven==0) then
        starBlank:draw(firstStarPosition.x,firstStarPosition.y)
        starBlank:draw(secondStarPosition.x,secondStarPosition.y)
        starBlank:draw(thirdStarPosition.x, thirdStarPosition.y)
        text("Nice!", WIDTH/2, HEIGHT-150)
    end
    ---one star
    if (numberOfStarsGiven==1) then
        starFilledIn:draw(firstStarPosition.x,firstStarPosition.y)
        starBlank:draw(secondStarPosition.x,secondStarPosition.y)
        starBlank:draw(thirdStarPosition.x, thirdStarPosition.y)
        text("Good!", WIDTH/2, HEIGHT-150)
        table.insert("stars", selectedLevel, 1)
    end
    ---two stars
    if (numberOfStarsGiven==2) then
        starFilledIn:draw(firstStarPosition.x,firstStarPosition.y)
        starFilledIn:draw(secondStarPosition.x,secondStarPosition.y)
        starBlank:draw(thirdStarPosition.x, thirdStarPosition.y)
        text("Great!", WIDTH/2, HEIGHT-150)
        table.insert("stars", selectedLevel, 2)
    end
    ---three stars
    if (numberOfStarsGiven>=3) then
        starFilledIn:draw(firstStarPosition.x,firstStarPosition.y)
        starFilledIn:draw(secondStarPosition.x,secondStarPosition.y)
        starFilledIn:draw(thirdStarPosition.x, thirdStarPosition.y)
        text("Awesome!", WIDTH/2, HEIGHT-150)
        table.insert("stars", selectedLevel, 3)
    end
    
     for i=1,numberOfQuestionsGotWrong do
        sprite(tableOfWrongAnswered.shapes, 100, dy-100*(#numberOfQuestionsGotWrong))
        text(tableOfWrongAnswered.names,600,dy-100*(#numberOfQuestionsGotWrong))--names
    end
end   
    playAgainButton:draw()
    settingsButton:draw()
    levelsButton:draw()
    nextLevelButton:draw()
    
     for i=1,numberOfQuestionsGotWrong do --number of wrong answers
        tableOfWrongAnswered[i]:draw()
    end
end
---touch
function StarsCollect:touched(touch)
    ---Get the stars
    
    starFilledIn:touched(touch)
    starBlank:touched(touch)
    mainScreenButton:touched(touch)
    levelsButton:touched(touch)
    settingsButton:touched(touch)
    
    --move to other scenes
    if (mainScreenButton.selected==true) then
        sound(SOUND_PICKUP, 0.3)
        deleteData()
        Scene.Change("main")
    end
    
    settingsButton:touched(touch)
    if (settingsButton.selected==true)then
        sound(SOUND_PICKUP, 0.3)
        deleteData()
        Scene.Change("settings")
    end
    
    levelsButton:touched(touch)
    if (levelsButton.selected==true) then
        sound(SOUND_PICKUP, 0.3)
        deleteData()
        Scene.Change("levels")
    end
    
   dy=dy+t.deltaY --To be able to scroll screen
end

function deleteData()
    ---Go to the scene where you type in the new player's name
        table.remove(tableOfWrongAnswered, all, all)
end
