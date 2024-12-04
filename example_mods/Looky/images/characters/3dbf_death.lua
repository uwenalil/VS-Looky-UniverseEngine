--data/'song'/

function onCreate()
    --Sprites mods/characters
    setPropertyFromClass('GameOverSubstate', 'characterName', '3dbf')
    --Death sound assets/shared/sounds
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx')
    --Dead music assets/shared/music
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver')
    --Retry sound assets/shared/music
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd')
end