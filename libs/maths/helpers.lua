function deg2rad(deg)
    return deg * (math.pi / 180)
end

function rad2vec(rad)
    return vec(math.cos(rad), math.sin(rad))    
end

function vec2rad(vector)
    return math.atan2(vector.y, vector.x)
end

