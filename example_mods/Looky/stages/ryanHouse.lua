function onCreate()
	-- background shit
	makeLuaSprite('ryanHouse', 'ryanHouse', -500, -300);
	setLuaSpriteScrollFactor('ryanHouse', 0.9, 0.9);
	

	addLuaSprite('ryanHouse', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end