local class = require 'ext.middleclass'

local Sprite = class('Sprite')

function Sprite:initialize(image)
    self.image              = image
    self.position           = vec(0, 0)
    self.width, self.height = self.image:getDimensions()
    self.origin             = vec(self.width/2, self.height/2)
    self.scale              = vec(1 ,1)
    self.rotation           = -(math.pi/2)
end


function Sprite:move(x, y)
    self.position = self.position + vec(x, y)
end

function Sprite:rotate(deg)
    self.rotation = self.rotation + deg2rad(deg)
end

function Sprite:setScale(sc)
    self.scale = vec(sc, sc)
end

function Sprite:update(dt)
end

function Sprite:draw()
    love.graphics.draw(self.image, self.position.x, self.position.y, self.rotation + (math.pi/2), self.scale.x, self.scale.y, self.origin.x, self.origin.y)
end

return Sprite
