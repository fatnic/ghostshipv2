Player = class('Player', Sprite)

Player:include(Physics)
Player:include(Collidable)

function Player:initialize()
    Sprite.initialize(self, Assets.images.ship)
    self.thrust = 15
    self.maxspeed = 5
    self.rotspeed = 90
    self.canFire = true
    self.fireDelay = 0.05
    self.friction = 1.02
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
            TEsound.play('assets/sounds/laser.wav', 'laser')
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