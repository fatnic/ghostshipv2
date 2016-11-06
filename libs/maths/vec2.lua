local vec2 = class("vec2")

function vec2:initialize(x,y)
    if x == nil then
        self.x = 0
        self.y = 0
    else
        self.x = x
        self.y = y
    end
end

function vec2:add(other)
    return vec2(self.x + other.x, self.y + other.y)
end

function vec2:minus(other)
    return vec2(self.x - other.x, self.y - other.y)
end

function vec2:multiply(other)
    return vec2(self.x * other.x, self.y * other.y)
end

function vec2:unpack()
    return self.x, self.y
end

return vec2
