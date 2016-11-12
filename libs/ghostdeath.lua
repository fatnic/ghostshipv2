GhostDeath = class('GhostDeath')

function GhostDeath:initialize(position, direction)
    self.position = position
    self.uuid = uuid()
    self.particles = love.graphics.newParticleSystem(Assets.images.particle, 16)
    self.particles:setParticleLifetime(0.5, 1)
    self.particles:setColors({150, 150, 150, 10})
    self.particles:setDirection(direction)
    self.particles:setSpeed(28)
    self.particles:setEmissionRate(16)
    self.particles:setEmitterLifetime(0.5)
    self.particles:emit(16)
end


function GhostDeath:update(dt)
    self.particles:update(dt)
    Timer.after(1, function() World.particles[self.uuid] = nil end)
end

function GhostDeath:draw()
    love.graphics.draw(self.particles, self.position:unpack())
end

return GhostDeath
