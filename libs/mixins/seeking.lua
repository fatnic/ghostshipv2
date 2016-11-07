Seeking = {}

function Seeking:included(self)
    self.maxforce = 0.055555
end

function Seeking:seek(target)
    local desired = target - self.position
    desired:normalizeInplace()
    desired = desired * self.maxspeed
    
    local steer = desired - self.velocity
    steer:trimInplace(self.maxforce)
    self:addForce(steer)
end

return Seeking
