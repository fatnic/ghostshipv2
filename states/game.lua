game = {}

World = { 
    width = 5000,
    height = 5000,
    enemies = {},
    bullets = {},
    score = 0,
    map = { width = 150, height = 150 },
}

function game:init()
    bg = Assets.images.background
    bg:setWrap('repeat', 'repeat')
    bgQuad = love.graphics.newQuad(0, 0, World.width, World.height, bg:getDimensions())

    player = Player:new()
    player.position = vec(World.width / 2, World.height / 2)
    
    for i=1, 50 do
        g = Ghost:new()
        g.position = vec(math.random(1, World.width), math.random(1, World.height))
        table.insert(World.enemies, g)
    end

    camera = Camera(player.position:unpack())
end

function game:update(dt)
    if Input:pressed 'escape' then love.event.push('quit') end

    -- for debug
    if Input:pressed 'heal' then player:heal(nil, true) end

    player:update(dt)

    for i, bullet in ipairs(World.bullets) do
        bullet:update(dt) 
        if bullet.delete then table.remove(World.bullets, i) end
    end

    for i, g in ipairs(World.enemies) do 
        g:seek(player.position)
        g:update(dt)

        if g:isCollidingWith(player) then
            TEsound.play('assets/sounds/fart.wav', 'damagePlayer')
            player:damage(1)
            table.remove(World.enemies, i)
            break
        end

        for j, b in ipairs(World.bullets) do
            if b:isCollidingWith(g) then
                World.score = World.score + g.points
                table.remove(World.bullets, j)
                table.remove(World.enemies, i)
                TEsound.play('assets/sounds/splat.wav', 'ghostdeath')
            end
        end

    end

    camera:lookAt(player.position:unpack())
end

function game:draw()
    camera:attach()
    love.graphics.draw(Assets.images.background, bgQuad, 0, 0)
    player:draw()
    for _, g in pairs(World.enemies) do g:draw() end
    for _, b in pairs(World.bullets) do b:draw() end
    camera:detach()

    love.graphics.setFont(fntDigital)
    love.graphics.print(love.timer.getFPS() .. " fps", Window.width - 90, 20) 

    for i=1, player.health do love.graphics.draw(Assets.images.heart, -20 + (32 * i) + 5, 20) end

    love.graphics.setColor(0, 0, 0, 200)
    love.graphics.rectangle('fill', Window.width - World.map.width - 20, Window.height - World.map.height - 20, World.map.width, World.map.height)
    
    love.graphics.setColor(255, 255, 255, 200)
    for _, g in pairs(World.enemies) do
        local mapx = g.position.x / World.width * World.map.width
        local mapy = g.position.y / World.height * World.map.height
        love.graphics.rectangle('fill', Window.width - World.map.width - 20 + mapx, Window.height - World.map.height - 20 + mapy, 2, 2)
    end

    love.graphics.setColor(0, 255, 0, 200)
    local mapx = player.position.x / World.width * World.map.width
    local mapy = player.position.y / World.height * World.map.height
    love.graphics.rectangle('fill', Window.width - World.map.width - 20 + mapx, Window.height - World.map.height - 20 + mapy, 4, 4)

    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setFont(fntScore)
    love.graphics.print("SCORE: " .. comma_value(World.score), 30, Window.height - 30)
end

