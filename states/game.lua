game = {}

World = { 
    width = 5000,
    height = 5000,
    enemies = {},
    projectiles = {},
    score = 0,
    map = { width = 150, height = 150 },
}

function game:init()
    bg = Assets.images.background
    bg:setWrap('repeat', 'repeat')
    bgQuad = love.graphics.newQuad(0, 0, World.width, World.height, bg:getDimensions())

    player = Player:new()
    player.position = vec(World.width / 2, World.height / 2)
    
    for i=1, 100 do
        g = Ghost:new()
        g.position = vec(math.random(1, World.width), math.random(1, World.height))
        g.maxspeed = math.random(1, 20) / 10.0
        table.insert(World.enemies, g)
    end

    camera = Camera(player.position:unpack())
end

function game:update(dt)
    if Input:pressed 'escape' then love.event.push('quit') end

    -- for debug
    if Input:pressed 'heal' then player:heal(nil, true) end

    player:update(dt)

    for i, projectile in ipairs(World.projectiles) do
        projectile:update(dt) 
        if projectile.delete then table.remove(World.projectiles, i) end
    end

    for i, g in ipairs(World.enemies) do 
        g:seek(player.position)
        g:update(dt)

        if g:isCollidingWith(player) then
            TEsound.play(player.damageSound)
            player:damage(1)
            screen:setShake(20)
            table.remove(World.enemies, i)
            break
        end

        for j, p in ipairs(World.projectiles) do
            if p:isCollidingWith(g) then
                g:damage(p.hitdamage)
                table.remove(World.projectiles, j)
                if g:isDead() then
                    World.score = World.score + g.points
                    table.remove(World.enemies, i)
                    TEsound.play(g.deathSound)
                end
            end
        end

    end

    Window.view.top = player.position.y - (Window.height /2)
    Window.view.left = player.position.x - (Window.width / 2)

    Window.campos.x = player.position.x
    Window.campos.y = player.position.y

    local bump = nil

    if player.position.x <= 0 + (Window.width / 2) then 
        Window.campos.x = (Window.width / 2)
        if player.position.x <= 0 then 
            player.position.x = 1
            bump = vec(0, 1) 
        end
    end

    if player.position.x >= World.width - (Window.width / 2) then 
        Window.campos.x = World.width - (Window.width / 2) 
        if player.position.x >= World.width then 
            player.position.x = World.width - 1
            bump = vec(0, -1) 
        end
    end

    if player.position.y <= 0 + (Window.height / 2) then 
        Window.campos.y = (Window.height / 2) 
        if player.position.y <= 0 then 
            player.position.y = 1
            bump = vec(1, 0)
        end
    end

    if player.position.y >= World.height - (Window.height / 2) then 
        Window.campos.y = World.height - (Window.height / 2) 
        if player.position.y >= World.height then 
            player.position.y = World.height -1  
            bump = vec(1, 0) 
        end
    end

    if bump then player:addForce(player.velocity:mirrorOn(bump) * 3) end

    camera:lookAt(Window.campos.x, Window.campos.y)
end

function game:draw()
    -- draw game
    screen:apply()
    camera:attach()
    love.graphics.draw(Assets.images.background, bgQuad, 0, 0)
    player:draw()
    for _, g in pairs(World.enemies) do g:draw() end
    for _, b in pairs(World.projectiles) do b:draw() end
    camera:detach()

    -- draw fps
    -- love.graphics.setFont(fntDigital)
    -- love.graphics.print(love.timer.getFPS() .. " fps", Window.width - 90, 20) 

    -- draw health
    for i=1, player.health do love.graphics.draw(Assets.images.heart, -20 + (38 * i) + 5, 20) end

    -- draw minimap
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

    -- draw score
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setFont(fntScore)
    love.graphics.print("SCORE: " .. comma_value(World.score), 30, Window.height - 30)
end

