Projectile = class('Projectile', Sprite)

Projectile:include(Physics)
Projectile:include(Collidable)

function Projectile:initialize(config, start, rot)
    Sprite.initialize(self, config.image)
    self.rotation = rot
    self.hitdamage = config.hitdamage or 1
    self.speed = config.speed or 8
    self.maxspeed = self.speed

    local xoff = config.xoffset or 0
    local yoff = config.yoffset or 0
    self.position = start + (rad2vec(self.rotation):normalized() * yoff)
    self.position = self.position + (rad2vec(self.rotation):perpendicular():normalizeInplace() * xoff)

    local rotoffset = config.rotoffset or 0
    self.velocity = rad2vec(self.rotation + deg2rad(rotoffset)) * self.speed
    self.delete = false
end

function Projectile:update(dt)
    self:updatePhysics(dt)
    self:updateCollidable()

    if self.position.x < Window.view.left or self.position.x > Window.view.left + Window.width then self.delete = true end
    if self.position.y <  Window.view.top or self.position.y > Window.view.top + Window.height  then self.delete = true end
end

function Projectile:draw()
    Sprite.draw(self)
    -- self:drawBB()
end

return Projectile
