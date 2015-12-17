HardWorldScene = class()

function HardWorldScene:init(x)
    -- you can accept and set parameters here
    self.x = x
end

function HardWorldScene:draw()
    -- Codea does not automatically call this method
    background(255, 163, 0, 255)
end

function HardWorldScene:touched(touch)
    -- Codea does not automatically call this method
end
