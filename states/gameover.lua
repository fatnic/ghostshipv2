gameover = {}

function gameover:init()
    Log.info('Switching state: gameover')
end

function gameover:update(dt)
    if Input:pressed 'fire' then love.run() end
end

function gameover:draw()
    love.graphics.print('GAME OVER', 40, 40)
    love.graphics.print('Score: ' .. World.score, 40, 70)
    love.graphics.print("Press 'SPACE' to continue", 40, 110)
end
