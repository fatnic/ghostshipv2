function deg2rad(deg)
    return deg * (math.pi / 180)
end

function rad2vec(rad)
    return vec(math.cos(rad), math.sin(rad))    
end

function vec2rad(vector)
    return math.atan2(vector.y, vector.x)
end

function isInView(thing)
    return thing.position.x > Window.view.left and thing.position.x < (Window.view.left + Window.width) and
           thing.position.y > Window.view.top and thing.position.y < (Window.view.top + Window.height)
end

function comma_value(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end
