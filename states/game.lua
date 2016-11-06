game = {}
World = { width = 5000, height = 5000, ghosts = {}, bullets = {} }

function game:init()
    player = Player:new()
    player.position = vec(World.width / 2, World.height / 2)
    
    for i=1, 50 do
        g = Ghost:new()
        g.position = vec(math.random(1, World.width), math.random(1, World.height))
        table.insert(World.ghosts, g)
    end

    camera = Camera(player.position:unpack())
end

function game:update(dt)
    if Input:pressed 'escape' then love.event.push('quit') end

    player:update(dt)

    for i, bullet in ipairs(World.bullets) do
        bullet:update(dt) 
        if bullet.delete then table.remove(World.bullets, i) end
    end

    for i, g in ipairs(World.ghosts) do 
        g:seek(player.position)
        g:update(dt)

        for j, b in ipairs(World.bullets) do
            if b:isCollidingWith(g) then
                table.remove(World.bullets, j)
                table.remove(World.ghosts, i)
                TEsound.play('assets/sounds/splat.wav', 'ghostdeath')
            end
        end

    end

    camera:lookAt(player.position:unpack())
end

function game:draw()
    camera:attach()
    love.graphics.draw(Assets.images.background, 0, 0)
    player:draw()
    for _, g in pairs(World.ghosts) do g:draw() end
    for _, b in pairs(World.bullets) do b:draw() end
    camera:detach()
end

