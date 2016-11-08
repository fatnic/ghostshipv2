Plasma = class('Plasma', Projectile)

function Plasma:initialize(start, rot, speed)
    Projectile.initialize(self, Assets.images.plasma, start, rot, speed)
    self.soundEffect = "assets/sounds/laser.wav"
    self.hitdamage = 2
end

function Plasma:update(dt)
    Projectile.update(self, dt)
end

return Plasma
