Player = class('Player', Sprite)

Player:include(Physics)
Player:include(Collidable)
Player:include(Health)

function Player:initialize()
    Sprite.initialize(self, Assets.images.ship)
    self.damageSound = 'assets/sounds/fart.wav'
    self.thrust = 15
    self.maxspeed = 5
    self.rotspeed = 120
    self.canFire = true
    self.fireDelay = 0.15
    self.friction = 1.02
    self.maxHealth = 3
    self.health = 3
end

function Player:input(dt)
    if Input:down 'forwards'  then self:accelerate(self.thrust * dt) end

    if Input:pressed 'forwards' then TEsound.play('assets/sounds/thrust.wav', 'thrust') end

    if Input:released 'forwards' then TEsound.stop('thrust') end

    if Input:down 'reverse'   then self.velocity = self.velocity / 1.1 end

    if Input:down 'rotleft'  then self:rotate(-self.rotspeed * dt) end
    if Input:down 'rotright' then self:rotate(self.rotspeed * dt) end

    if Input:down 'fire' then 
        if self.canFire then
            self.canFire = false
            self:fireBullet()
            Timer.after(self.fireDelay, function() self.canFire = true end)
        end
    end
end

function Player:accelerate(speed) 
    f = rad2vec(self.rotation) * speed
    self:addForce(f, self.maxspeed)
end

function Player:fireBullet()
    local bulletPos = self.position + (rad2vec(self.rotation) * 20)
    local b = Bullet:new(bulletPos, self.rotation, 10)
    TEsound.play(b.soundEffect, 'fire')
    table.insert(World.bullets, b)
end

function Player:update(dt)
    self:input(dt)
    self:updatePhysics(dt)
    self:updateCollidable(dt)
end

function Player:draw()
    Sprite.draw(self)
end

return Player
