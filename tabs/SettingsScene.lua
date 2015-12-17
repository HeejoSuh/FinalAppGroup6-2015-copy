SettingsScene = class()
local settingsBackButton
function SettingsScene:init()
    -- you can accept and set parameters here
    
 settingsBackButton = Button("Dropbox:Blue Back Circle Button", vec2(60, 708, 100, 100))   
    

end

function SettingsScene:draw()
    -- Codea does not automatically call this method
    background(0, 22, 255, 255)
    
    settingsBackButton:draw()
    
    fill(255, 255, 255, 255)
    fontSize(50)
    font("Arial-ItalicMT")
    text("Settings", 200, 300)
end

function SettingsScene:touched(touch)
    -- Codea does not automatically call this method
    
    settingsBackButton:touched(touch)
    if(settingsBackButton.selected == true)then
        Scene.Change("play")
    end
end
