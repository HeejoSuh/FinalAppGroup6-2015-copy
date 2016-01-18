--- Medium World Scene
---created by Heejo Suh
---Created in 2015~2016
---Created for the ICS2O
---This folder lists the levels in the world


MediumWorldScene = class()

local buttons={}
local buttonPos={}
local buttonObjects
local goBackButton

function MediumWorldScene:init()
    -- you can accept and set parameters here
    goBackButton= Button("Dropbox:Teal Back Circle Button", 100, HEIGHT-100)
    
    buttonPos={vec2(2*(WIDTH/7), HEIGHT/2-300), vec2(3*(WIDTH/7), HEIGHT/2-300), vec2(4*(WIDTH/7), HEIGHT/2-300), vec2(5*(WIDTH/7), HEIGHT/2-300), vec2(6*(WIDTH/7), HEIGHT/2-300), 
    vec2(2*(WIDTH/7), HEIGHT/2+200), vec2(3*(WIDTH/7), HEIGHT/2+200), vec2(4*(WIDTH/7), HEIGHT/2+200), vec2(5*(WIDTH/7), HEIGHT/2+200), vec2(6*(WIDTH/7), HEIGHT/2+200)}
    
    buttonObjects= Button("Dropbox:empty template button", buttonPos.x, buttonPos.y, 100, 100)
    for i= 11, 20 do
        table.insert("buttons", i, buttonObjects)
    end
end

function MediumWorldScene:draw()
    -- Codea does not automatically call this method
    background(121, 181, 186, 255)
    fontSize (60)
    fill(26, 140, 176, 255)
    font("Noteworthy-Bold")
    textMode (CENTER)
    pushStyle ()
    text("Medium World", WIDTH/2, HEIGHT-200)
    goBackButton:draw()
    
    buttons:draw()
    for i= 1, 10 do
        if stars[i]==0 then
            sprite("Dropbox:Star Black", buttonPos[i].x-10, buttonPos[i].y, 10, 10)
            sprite("Dropbox:Star Black", buttonPos[i].x, buttonPos[i].y, 10, 10)
            sprite("Dropbox:Star Black", buttonPos[i].x+10, buttonPos[i].y, 10, 10)
        end
        if stars[i]==1 then
            sprite("Dropbox:Star Gold", buttonPos[i].x-10, buttonPos[i].y, 10, 10)
            sprite("Dropbox:Star Black", buttonPos[i].x, buttonPos[i].y, 10, 10)
            sprite("Dropbox:Star Black", buttonPos[i].x+10, buttonPos[i].y, 10, 10)
        end
        if stars[i]==2 then
            sprite("Dropbox:Star Gold", buttonPos[i].x-10, buttonPos[i].y, 10, 10)
            sprite("Dropbox:Star Gold", buttonPos[i].x, buttonPos[i].y, 10, 10)
            sprite("Dropbox:Star Black", buttonPos[i].x+10, buttonPos[i].y, 10, 10)
        end
        if stars[i]==3 then
            sprite("Dropbox:Star Black", buttonPos[i].x-10, buttonPos[i].y, 10, 10)
            sprite("Dropbox:Star Black", buttonPos[i].x, buttonPos[i].y, 10, 10)
            sprite("Dropbox:Star Black", buttonPos[i].x+10, buttonPos[i].y, 10, 10)
        end
    end
end

function MediumWorldScene:touched(touch)
    -- Codea does not automatically call this method
    goBackButton:touched(touch)
    if (goBackButton.selected==true) then
        Scene.Change("world")
    end
    buttons.touched(touch)
        
    if (buttons[i].selected==true) then
        if (i== true) then
        Scene.Change("gamePlay")     
        elseif (i== false) and (i-1== false) then
        alert("You have not unlocked".." the previous level", "Nope!")
        elseif (selectedLevel== false) and (selectedLevel-1== true) then
        i= selectedLevel
        Scene.Change("Unlock")
        end
    end
end
