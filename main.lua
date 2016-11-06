-- libraries
Gamestate = require 'ext.hump.gamestate'
Timer     = require 'ext.hump.timer'
Log       = require 'ext.log'
Camera    = require 'ext.hump.camera'
Assets    = require('ext.cargo').init('assets')
HC        = require 'ext.HC'
vec       = require 'ext.hump.vector'
class     = require 'ext.middleclass'

-- helpers
require 'libs.maths.helpers'

-- states
require 'states.splash'
require 'states.mainmenu'
require 'states.game'

-- mixins
Physics = require 'libs.mixins.physics'
Seeking = require 'libs.mixins.seeking'
Collidable = require 'libs.mixins.collidable'

-- entities
Sprite = require 'libs.sprite'
Player = require 'libs.player'
Ghost = require 'libs.ghost'
Bullet = require 'libs.bullet'

-- window
Window = { width = 0, height = 0, oldWidth = 800, oldHeight = 600 } 

-- input
baton = require 'ext.baton'
Input = baton.new({
    rotleft  = {'key:left', 'key:a'},
    rotright = {'key:right', 'key:d'},
    forwards = {'key:up', 'key:w'},
    reverse  = {'key:down', 'key:s'},
    fire     = {'key:space'},

    escape   = {'key:escape'},
    fullscreen = {'key:/'},
})

-- love
function love.load(args)
    love.mouse.setVisible(false)
    Window.width = love.graphics:getWidth()
    Window.height = love.graphics:getHeight()
    Gamestate.registerEvents()
    Gamestate.switch(game)
end

function love.update(dt)
    if Input:pressed 'fullscreen' then 

        if love.window.getFullscreen() then
            love.window.setMode(Window.oldWidth, Window.oldHeight)            
        else
            Window.oldWidth = Window.width
            Window.oldHeight = Window.height
            love.window.setFullscreen(true)
        end

    end
    Input:update()
    Timer.update(dt)
end

function love.resize(w, h)
    Window.width = w
    Window.height = h
end

function love.draw()
end
