Bullet = class('Bullet', Sprite)

Bullet:include(Physics)
Bullet:include(Collidable)

function Bullet:initialize(start, rot, speed)
    Sprite.initialize(self, Assets.images.laser)
    self.maxspeed = speed
    self.position = start
    self.rotation = rot
    self.velocity = rad2vec(rot) * speed
    self.delete = false
end

function Bullet:update(dt)
    self:updatePhysics(dt)
    self:updateCollidable()

    if self.position.x < -20 or self.position.x > World.width + 20 then self.delete = true end
    if self.position.y < -20 or self.position.y > World.height + 20 then self.delete = true end
end

function Bullet:draw()
    Sprite.draw(self)
    -- self:drawBB()
end

return Bullet
