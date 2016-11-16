mainmenu = {}

function mainmenu:init()
end

function mainmenu:update(dt)
    if Input:pressed 'escape' then love.event.push('quit') end
    if Input:pressed 'fire' then Gamestate.switch(game) end
end

function mainmenu:draw()
    local x, y = love.graphics.getDimensions()
    love.graphics.print('This is the mainmenu page', 40, 40)
    love.graphics.print('press \'space\' to start...', x/2, y/2)
    love.graphics.print('hi-score: ' .. Window.hiscore, Window.width/2, Window.height - 20)
end
