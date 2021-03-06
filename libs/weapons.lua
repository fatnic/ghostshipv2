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
            { image = Assets.images.plasma, speed = 12, hitdamage = 10, yoffset = 20, },
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, xoffset = -10, yoffset = 0, rotoffset = -2, },
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, xoffset =  10, yoffset = 0, rotoffset =  2, },
        }
    },

    plasma = {
        sound = 'assets/sounds/laser.wav',
        cooldown = 0.2,
        projectiles = { 
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, yoffset = 20, },
        }
    },

    dualplasma = {
        sound = 'assets/sounds/laser.wav',
        cooldown = 0.2,
        projectiles = { 
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, xoffset = -10, yoffset = 0, },
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, xoffset =  10, yoffset = 0, },
        }
    },

    triplasma = {
        sound = 'assets/sounds/laser.wav',
        cooldown = 0.2,
        projectiles = { 
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, yoffset = 20, },
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, xoffset = -10, yoffset = 0, rotoffset = -2, },
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, xoffset =  10, yoffset = 0, rotoffset =  2, },
        }
    },

    septplasma = {
        sound = 'assets/sounds/laser.wav',
        cooldown = 0.2,
        projectiles = { 
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, yoffset = 20, },
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, xoffset = -10, yoffset = 0, rotoffset = -2, },
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, xoffset =  10, yoffset = 0, rotoffset =  2, },
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, xoffset = -20, yoffset = 0, rotoffset = -2, },
            { image = Assets.images.plasma, speed = 8, hitdamage = 2, xoffset =  20, yoffset = 0, rotoffset =  2, },
        }
    },

}

return Weapons
