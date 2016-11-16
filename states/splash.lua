splash = {}

function splash:init()
    Log.info('Switching state: splash')
end

function splash:update(dt)
    showmenu = Timer.after(4, function() Gamestate.switch(mainmenu) end)
    if Input:pressed 'fire' then
        Timer.cancel(showmenu)
        Gamestate.switch(mainmenu) 
    end
end

function splash:draw()
    love.graphics.print('This is the splash page', 40, 40)
end
