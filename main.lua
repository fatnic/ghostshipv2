-- libraries
Gamestate = require 'ext.hump.gamestate'
Timer     = require 'ext.hump.timer'
Log       = require 'ext.log'
Camera    = require 'ext.hump.camera'
Assets    = require('ext.cargo').init('assets')
HC        = require 'ext.HC'
vec       = require 'ext.hump.vector'
class     = require 'ext.middleclass'
anim8     = require 'ext.anim8'
screen    = require 'ext.shack'

require 'ext.TEsound'

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
Health = require 'libs.mixins.health'

-- entities
Sprite = require 'libs.sprite'
Player = require 'libs.player'
Ghost = require 'libs.ghost'

Projectile = require 'libs.projectile'
Weapons = require 'weapons'

-- fonts
fntScore = Assets.fonts.grobold(20)
fntDigital = Assets.fonts.arcadeclassic(18)

-- window
Window = { width = 0, height = 0, oldWidth = 800, oldHeight = 600, view = { top = 0, left = 0 }, campos = { x = 0, y = 0 }} 

-- input
baton = require 'ext.baton'
Input = baton.new({
    rotleft    = {'key:left', 'key:a'},
    rotright   = {'key:right', 'key:d'},
    forwards   = {'key:up', 'key:w'},
    reverse    = {'key:down', 'key:s'},
    fire       = {'key:space'},

    heal       = {'key:h'},

    bullet     = {'key:1'},
    dualbullet = {'key:2'},
    tribullet  = {'key:3'},

    plasma     = {'key:4'},
    dualplasma = {'key:5'},
    triplasma  = {'key:6'},
    septplasma = {'key:7'},

    escape     = {'key:escape'},
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
			Window.width = Window.oldWidth
			Window.height = Window.oldHeight
        else
            Window.oldWidth = Window.width
            Window.oldHeight = Window.height
            love.window.setFullscreen(true)
        end

    end
    screen:update(dt)
    Input:update()
    Timer.update(dt)
    TEsound.cleanup()
end

function love.resize(w, h)
    Window.width = w
    Window.height = h
end

function love.draw()
end
