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
    self.friction = 1.02
    self.maxHealth = 3
    self.health = 3
    self.weapon = 'bullet'
end

function Player:input(dt)
    if Input:down 'forwards'  then self:accelerate(self.thrust * dt) end

    if Input:pressed 'forwards' then TEsound.play('assets/sounds/thrust.wav', 'thrust') end

    if Input:released 'forwards' then TEsound.stop('thrust') end

    if Input:down 'reverse'   then self.velocity = self.velocity / 1.1 end

    if Input:down 'rotleft'  then self:rotate(-self.rotspeed * dt) end
    if Input:down 'rotright' then self:rotate(self.rotspeed * dt) end

    if Input:pressed 'bullet' then self.weapon = 'bullet' end
    if Input:pressed 'dualbullet' then self.weapon = 'dualbullet' end
    if Input:pressed 'tribullet' then self.weapon = 'tribullet' end
    if Input:pressed 'plasma' then self.weapon = 'plasma' end
    if Input:pressed 'dualplasma' then self.weapon = 'dualplasma' end
    if Input:pressed 'triplasma' then self.weapon = 'triplasma' end

    if Input:down 'fire' then 
        if self.canFire then
            self.canFire = false
            self:fireBullet()
        end
    end
end

function Player:accelerate(speed) 
    f = rad2vec(self.rotation) * speed
    self:addForce(f, self.maxspeed)
end

function Player:fireBullet()
    for _, p in pairs(Weapons[self.weapon].projectiles) do
        local b = Projectile:new(p, self.position, self.rotation)
        table.insert(World.projectiles, b)
    end
    Timer.after(Weapons[self.weapon].cooldown, function() self.canFire = true end)
    TEsound.play(Weapons[self.weapon].sound, 'fire')
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
