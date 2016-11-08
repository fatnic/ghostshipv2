local Weapons = {

    bullet = {
        sound = 'assets/sounds/laser.wav',
        projectiles = { 
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, yoffset = 20, cooldown = 0.2 },
        }
    },

    dualbullet = {
        sound = 'assets/sounds/laser.wav',
        projectiles = { 
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, xoffset = -10, yoffset = 0, cooldown = 0.2 },
            { image = Assets.images.bullet, speed = 8, hitdamage = 1, xoffset =  10, yoffset = 0, cooldown = 0.2 },
        }
    },
}

return Weapons
