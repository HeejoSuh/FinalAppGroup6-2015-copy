
----Ranking
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder shows who the best player is.

Ranking= class()

local goBackButton

function Ranking:init()
end

---draw
function Ranking:draw()
    background(9, 209, 226, 255)
    goBackButton:draw()
end

---touch
function Ranking:touched(touch)
      goBackButton:touched(touch)
    
    if goBackButton.selected==true then
        Scene.Change("main")
    end
end
