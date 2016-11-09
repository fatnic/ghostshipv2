Seeking = {}

function Seeking:included(self)
    self.maxforce = 0.055555
    self.target = nil
end

function Seeking:seek()
    if self.target then
        local desired = self.target - self.position
        desired:normalizeInplace()
        desired = desired * self.maxspeed
        local steer = desired - self.velocity
        steer:trimInplace(self.maxforce)
        self:addForce(steer)
    end
end

return Seeking
