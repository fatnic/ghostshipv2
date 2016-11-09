Collidable = {}

function Collidable:updateCollidable(dt)
    self.bb = self.bb or HC.rectangle(0, 0, self.width, self.height)
    self.bb:moveTo(self.position:unpack())
    self.bb:setRotation(self.rotation - (math.pi/2))
end

function Collidable:isCollidingWith(other)
    if not self.bb then Log.error(self.class.name .. ' is missing bb'); return false end
    if not other.bb then Log.error(other.class.name .. ' is missing bb'); return false end

    return self.bb:collidesWith(other.bb)
end

function Collidable:drawBB()
    love.graphics.setColor(0, 255, 0)
    self.bb:draw('line')
    love.graphics.setColor(255, 255, 255)
end

return Collidable
