local Weapons = {

    bullet = {
        sound = 'assets/sounds/laser.wav',
        cooldown = 0.2,
        projectiles = { 
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, yoffset = 20, },
        }
    },

    dualbullet = {
        sound = 'assets/sounds/laser.wav',
        cooldown = 0.2,
        projectiles = { 
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, xoffset = -10, yoffset = 0, },
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, xoffset =  10, yoffset = 0, },
        }
    },

    tribullet = {
        sound = 'assets/sounds/laser.wav',
        cooldown = 0.2,
        projectiles = { 
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, yoffset = 20, },
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, xoffset = -10, yoffset = 0, rotoffset = -5, },
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, xoffset =  10, yoffset = 0, rotoffset =  5, },
        }
    },
}

return Weapons
