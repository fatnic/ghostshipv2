Bullet = class('Bullet', Projectile)

function Bullet:initialize(start, rot, speed)
    Projectile.initialize(self, Assets.images.bullet, start, rot, speed)
    self.soundEffect = "assets/sounds/laser.wav"
    self.hitdamage = 1
end

function Bullet:update(dt)
    Projectile.update(self, dt)
end

return Bullet
