Physics = {}

function Physics:included(self)
    self.velocity = vec(0, 0)
    self.acceleration = vec(0, 0)
    self.maxspeed = 1
    self.friction = 1
end

function Physics:addForce(force)
    self.velocity = self.velocity + force
end

function Physics:updatePhysics(dt)
    self.velocity = self.velocity + self.acceleration
    self.position = self.position + self.velocity
    self.velocity = self.velocity / self.friction
    self.acceleration = vec(0, 0)
    self.velocity:trimInplace(self.maxspeed)
end

return Physics
