Ghost = class('Ghost', Sprite)

Ghost:include(Physics)
Ghost:include(Seeking)
Ghost:include(Collidable)

function Ghost:initialize(image)
    Sprite.initialize(self, Assets.images.ghost)
    self.maxspeed = 0.5
end

function Ghost:update(dt)
    self:updatePhysics(dt)    
    self.rotation = vec2rad(self.velocity)
    self:updateCollidable()
end

function Ghost:draw()
    Sprite.draw(self)
    -- self:drawBB()
end

return Ghost
