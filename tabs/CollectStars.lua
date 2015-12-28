----StarsCollect
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder determines the number of stars given

StarsCollect= class()

local numberOfQuestionsGotRight --from the game played
local numberOfQuestionsGotWrong --from the game played
local numberOfStarsGiven  ---based on the person's score
local gameMode  ---the gamemode of the game played

local starFilledIn
local starBlank
local firstStarPosition= vec2(WIDTH/2-300, HEIGHT/2+250)
local secondStarPosition= vec2(WIDTH/2, HEIGHT/2+250)
local thirdStarPosition= vec2(WIDTH/2+300, HEIGHT/2+250)

local playAgainButton  ---goes to main/home screen
local levelsButton  ---goes to levels
local settingsButton  ---goes to settings
local nextLevelButton --goes to next level

local dy= HEIGHT/2
local tableOfWrongAnswered


----init
function StarsCollect:init()
    starFilledIn= SpriteObject("Dropbox:Star Gold")
    starBlank= SpriteObject("Dropbox:Star Black") 
    starFilledIn.draggable= false
    starBlank.draggable= false
    
      ---buttons
   levelsButton= Button("Dropbox:Teal Level Menu Button", vec2(WIDTH/2-300, dy-100*(thequestionGotWrong+10)))
    nextLevelButton= Button("Dropbox:Teal Forward Button", vec2(WIDTH/2-100, dy-100*(thequestionGotWrong+10)))
    playAgainButton= Button("Dropbox:Teal Redo Button", vec2(WIDTH/2+100, dy-100*(thequestionGotWrong+20)))
    settingsButton= Button("Dropbox:Teal Settings Button", vec2(WIDTH/2+300, dy-100*(thequestionGotWrong+20)))
    
    --easy mode
    if (gameMode==easy) then
        if numberOfQuestionsGotRight<=1 then
            numberOfStarsGiven= 0
        end
        if numberOfQuestionsGotRight<=3 then
            numberOfStarsGiven= 1
        end
        if numberOfQuestionsGotRight<=4 then
            numberOfStarsGiven= 2
        end
        if numberOfQuestionsGotRight>=6 then
            numberOfStarsGiven= 3
        end
end
    
    ---medium
    if (gameMode==normal) then
        if numberOfQuestionsGotRight<=2 then
            numberOfStarsGiven= 0
        end
        if numberOfQuestionsGotRight<=4 then
            numberOfStarsGiven= 1
        end
        if numberOfQuestionsGotRight<=5 then
            numberOfStarsGiven= 2
        end
        if numberOfQuestionsGotRight>=7 then
            numberOfStarsGiven= 3
        end
    end
    
    ---hard
    if (gameMode==hard) then 
        if numberOfQuestionsGotRight<=3 then
            numberOfStarsGiven= 0
        end
        if numberOfQuestionsGotRight<=5 then
            numberOfStarsGiven= 1
        end
        if numberOfQuestionsGotRight<=6 then
            numberOfStarsGiven= 2
        end
        if numberOfQuestionsGotRight>=8 then
            numberOfStarsGiven= 3 
        end
end
    
    
    answerChoosen= wrong --DO THIS FOR NOW
    numberOfQuestionsGotWrong= 0 ---DO THIS FOR NOW
    tableOfWrongAnswered={}
    
    if (answerChoosen== wrong) then
        numberOfQuestionsGotWrong= numberOfQuestionsGotWrong+1
        
        for numberOfQuestionsGotWrong=1,numberOfQuestionsGotWrong do

        table.insert(tableOfWrongAnswered[numberOfQuestionsGotWrong].shapes, SpriteObject("currentShape", 100, dy-100*(thequestionGotWrong)))--shapes
        
        table.insert(tableOfWrongAnswered[numberOfQuestionsGotWrong].names, text("nameofCurrentShape", 250,dy-100*(thequestionGotWrong)))--names
    end
end
    tableOfWrongAnswered[i]=tableOfWrongAnswered(1,numberOfQuestionsGotWrong)
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
    text("⭐️".."numberOfStarsOwned", (WIDTH/2), 380)
    
    
    fontSize (80)
    fill(18, 21, 26, 255)
    font("Verdana-Bold")
    
     --- The stars actually given(now) to the player 
    ---zero star
    if (numberOfStarsGiven==0) then
        starBlank:draw(firstStarPosition, secondStarPosition, thirdStarPosition)
        text("Nice!", 514, 500)
    end
    ---one star
    if (numberOfStarsGiven==1) then
        starFilledIn:draw(firstStarPosition)
starBlank:draw(secondStarPosition, thirdStarPosition)
        text("Good!", 514, 500)
    end
    ---two stars
    if (numberOfStarsGiven==2) then
        starFilledIn:draw(firstStarPosition,secondStarPosition)
        starBlank:draw(thirdStarPosition)
        text("Great!", 514, 500)
    end
    ---three stars
    if (numberOfStarsGiven==3) then
        starFilledIn:draw(firstStarPosition, secondStarPosition, thirdStarPosition)
        text("Awesome!", 514, 500)
    end
    
    playAgainButton:draw()
    settingsButton:draw()
    levelsButton:draw()
    nextLevelButton:draw()
    
     for numberOfQuestionsGotWrong=1,numberOfQuestionsGotWrong do --number of wrong answers
        tableOfWrongAnswered[i]:draw()
    end
end
---touch
function StarsCollect:touched(touch)
      if (numberOfStarsGiven~=0) then
            numberOfStarsOwned= numberOfStarsOwned+ numberOfStarsGiven
        end
    
      ---add in the achieved stars to the number of stars the player has collected
    numberOfStarsOwned= numberOfStarsOwned+ numberOfStarsGiven
    
    starFilledIn:touched(touch)
    starBlank:touched(touch)
    mainScreenButton:touched(touch)
    levelsButton:touched(touch)
    settingsButton:touched(touch)
    
    --move to other scenes
    if (mainScreenButton.selected==true) then
        Scene.Change("main")
    end
    
    settingsButton:touched(touch)
    if (settingsButton.selected==true)then
        Scene.Change("settings")
    end
    
    levelsButton:touched(touch)
    if (levelsButton.selected==true) then
        Scene.Change("levels")
    end
    
   dy=dy+t.deltaY
end