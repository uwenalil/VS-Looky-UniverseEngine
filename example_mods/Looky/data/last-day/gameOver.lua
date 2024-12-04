function onCreate() -- Game Over fix
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfLastDay-dead'); -- file in mods/characters
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'wi-dead'); -- file in mods/sounds
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'wi-gameOver'); -- file in mods/music
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'wi-retry'); -- file in mods/music
end