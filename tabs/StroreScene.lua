
----Ranking
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder shows who the best player is.

Ranking= class()

function Ranking:init()
end

---draw
function Ranking:draw()
    background(9, 209, 226, 255)
      ---number of stars the player has achieved so far
    fontSize (50)
    fill(20, 29, 31, 255)
    font("Noteworthy-Bold")
    textMode (CENTER)
    text("Best player is", WIDTH/2, 800)
    text(bestPlayerScore.." questions got right", WIDTH/2+100, 300)
    
    fontSize (80)
    fill(0, 0, 0, 255)
    font("Baskerville-SemiBoldItalic")
    text(bestPlayerName, 70, 550)

    goBackButton:draw()
end

---touch
function Ranking:touched(touch)
      goBackButton:touched(touch)
    
    if goBackButton.selected==true then
        Scene.Change("main")
    end
end
