CreditsScene = class()
local backToMainButton
function CreditsScene:init()
    -- you can accept and set parameters here
 backToMainButton = Button("Dropbox:Blue Back Circle Button", vec2(60, 708, 100, 100))   
    --sprite()
end

function CreditsScene:draw()
    -- Codea does not automatically call this method
    background(187, 187, 187, 255)

    backToMainButton:draw()
    
    
    fill(19, 19, 19, 255)
    fontSize(100)
    font("HelveticaNeue")
    text("Credits", WIDTH/2, 668)
    fontSize(50)
    text("People Who Helped Create This", WIDTH/2, 550)
    text("Mars", WIDTH/2, 450)
     text("Sophia", WIDTH/2, 390)
      text("Niamh", WIDTH/2, 320 )
     text("Warsame Egeh",WIDTH/2, 260)
    text("Heejo Suh", WIDTH/2, 190)
    text("Ben Jenkins",WIDTH/2, 120)
    text("Alessandro Iaderosa", WIDTH/2, 50)
end


function CreditsScene:touched(touch)
    -- Codea does not automatically call this method
    backToMainButton:touched(touch)
    if(backToMainButton.selected == true) then
        Scene.Change("play")
    end
end
