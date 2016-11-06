Bullet = class('Bullet', Sprite)

Bullet:include(Physics)
Bullet:include(Collidable)

function Bullet:initialize(start, rot, speed)
    Sprite.initialize(self, Assets.images.laser)
    self.maxspeed = speed
    self.position = start
    self.rotation = rot
    self.velocity = rad2vec(rot) * speed
end

function Bullet:update(dt)
    self:updatePhysics(dt)
    self:updateCollidable()
end

function Bullet:draw()
    Sprite.draw(self)
    -- self:drawBB()
end

return Bullet
