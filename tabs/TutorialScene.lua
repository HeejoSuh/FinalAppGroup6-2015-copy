TutorialScene = class()
local tutorialButton
local worldButton
local mediumWorldButton
local easyWorldButton 
local hardworldButton
function TutorialScene:init()
    -- you can accept and set parameters here
    tutorialButton = Button("Dropbox:Blue Back Circle Button", vec2(60, 710, 100, 100))  
    worldButton = Button("Dropbox:Blue Forward Button", vec2(400, 400, 100, 100))
    mediumWorldButton = Button("Dropbox:Blue Level Menu Button", vec2(350, 400, 100, 100))
    easyWorldButton = Button("Dropbox:Blue Level Menu Button", vec2(350, 200,100, 100))
    hardworldButton = Button("Dropbox:Green Level Menu Button", vec2(350, 450, 100, 100))
    
    
end
-- sprite("Dropbox:Blue Back Circle Button")
function TutorialScene:draw()
    -- Codea does not automatically call this method
    background(255, 0, 0, 255)
    fill(159, 159, 159, 255)
    tutorialButton:draw()
    worldButton:draw()
    mediumWorldButton:draw()
    easyWorldButton:draw()
end

function TutorialScene:touched(touch)
    -- Codea does not automatically call this method
  tutorialButton:touched(touch)  
    if(tutorialButton.selected == true)then
        Scene.Change("play")

     end
    
    worldButton:touched(touch)
    if(worldButton.selected == true)then
        Scene.Change("world")
    end
    mediumWorldButton:touched(touch)
    if(mediumWorldButton.selected == true)then
       Scene.Change("medium")
    end
    easyWorldButton:touched(touch)
    if(easyWorldButton.selected == true)then
        Scene.Change("easy")
    end
    hardworldButton:touched(touch)
    if(hardworldButton.selected == true)then
        Scene.Change("hard")
    end
end
