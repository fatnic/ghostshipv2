Ghost = class('Ghost', Sprite)

Ghost:include(Physics)
Ghost:include(Seeking)
Ghost:include(Collidable)
Ghost:include(Health)

function Ghost:initialize()
    Sprite.initialize(self, Assets.images.ghost)
    self.deathSound = "assets/sounds/splat.wav"
    self.maxspeed = 1
    self.points = 1000
    self.health = 2
    self.hitdamage = 1
end

function Ghost:update(dt)
    self:seek()
    self:updatePhysics(dt)    
    self.rotation = vec2rad(self.velocity)
    self:updateCollidable()

    if self.position.x - self.target.x <= 2 then
        if self.position.y - self.target.y <= 2 then
            self.target = nil
        end
    end
end

function Ghost:setRandomTarget()
    local targetx = math.random(5, World.width - 5)
    local targety = math.random(5, World.height - 5)
    self.target = vec(targetx, targety)
end

function Ghost:kill()
    TEsound.play(self.deathSound)
    dp = GhostDeath:new(self.position, self.rotation)
    World.particles[dp.uuid] = dp
    World.enemies[self.uuid] = nil
    World.enemiescount = World.enemiescount - 1
end

function Ghost:draw()
    Sprite.draw(self)
    -- self:drawBB()
end

return Ghost
