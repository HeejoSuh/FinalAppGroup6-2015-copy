---World Scene
---created by Heejo Suh
---Created in 2015~2016
---Created for the ICS2O
---This folder lists the types of worlds

WorldScene = class()

local easy
local medium
local hard
local back

function WorldScene:init()
    -- you can accept and set parameters here
    easy= Button("Dropbox:Easy mode", vec2(WIDTH/2-150, HEIGHT/2))
    medium= Button("Dropbox:Meedium mode", vec2(WIDTH/2, HEIGHT/2))
    hard= Button("Dropbox:Hard mode", vec2(WIDTH/2+150, HEIGHT/2))
    back= Button("Dropbox:Teal Back Circle Button", vec2(100, HEIGHT-100))
end

function WorldScene:draw()
    -- Codea does not automatically call this method
    background(90, 144, 167, 255)
    easy:draw()
    medium:draw()
    hard:draw()
    back:draw()
    fontSize (40)
    fill(9, 9, 9, 255)
    font("Noteworthy-Bold")
    textMode (CENTER)
    pushStyle ()
    text("Worlds", WIDTH/2, HEIGHT-100)
end

function WorldScene:touched(touch)
    -- Codea does not automatically call this method
    if levels[1]==true then
    easy:touched(touch)
    if (easy.selected==true) then
        Scene.Change("easy")
    end
    end
    if levels[11]==true then
    medium:touched(touch)
    if (medium.selected==true) then
        Scene.Change("medium")
    end
    end
    if levels[21]==true then    
    hard:touched(touch)
    if (hard.selected==true) then
        Scene.Change("hard")
    end
    end
    back:touched(touch)
    if (back.selected==true) then
        Scene.Change("play")
    end
end
