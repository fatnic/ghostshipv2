Health = {}

function Health:included(self)
    self.maxHealth = 100
    self.health = 100
end

function Health:damage(amount)
    self.health = self.health - amount
end

function Health:heal(amount, full)
    if full then self.health = self.maxHealth else self.health = self.health + amount end
end

function Health:isDead()
    return self.health <= 0
end

return Health

